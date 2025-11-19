import 'package:flutter/material.dart';
import 'package:find_job_mobile/app/config/service_locator.dart';
import 'package:find_job_mobile/shared/data/models/employer_profile_dto.dart';
import 'package:find_job_mobile/shared/data/models/job_dto.dart';
import 'package:find_job_mobile/shared/data/repositories/employer_profile_repository.dart';
import 'package:find_job_mobile/shared/data/repositories/candidate_follower_repository.dart';
import 'package:find_job_mobile/shared/data/repositories/job_repository.dart';
import 'package:find_job_mobile/shared/styles/colors.dart';
import 'package:find_job_mobile/shared/styles/text_styles.dart';
import 'package:find_job_mobile/modules/detail/widgets/employer/about_tab_widget.dart';
import 'package:find_job_mobile/modules/detail/widgets/employer/jobs_tab_widget.dart';
import 'package:find_job_mobile/modules/detail/widgets/employer/job_card_widget.dart';
import 'package:find_job_mobile/modules/detail/widgets/employer/relative_company_card_widget.dart';
import 'package:find_job_mobile/modules/detail/pages/job_detail_page.dart';
import 'package:intl/intl.dart';

class EmployerDetailPage extends StatefulWidget {
  final String employerId;

  const EmployerDetailPage({super.key, required this.employerId});

  @override
  State<EmployerDetailPage> createState() => _EmployerDetailPageState();
}

class _EmployerDetailPageState extends State<EmployerDetailPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  bool _isFollowing = false;
  bool _isLoading = true;
  bool _isFollowLoading = false;
  EmployerProfileDto? _profile;
  List<JobDto> _jobs = [];
  List<EmployerProfileDto> _relatedCompanies = [];
  final _repository = getIt<EmployerProfileRepository>();
  final _followerRepository = getIt<CandidateFollowerRepository>();
  final _jobRepository = getIt<JobRepository>();

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _loadProfile();
  }

  Future<void> _loadProfile() async {
    try {
      final profileResponse = await _repository.getProfile(widget.employerId);
      
      if (mounted) {
        setState(() {
          _profile = profileResponse.data;
        });
        
        // Try to check follow status, but don't fail if it errors
        // (e.g., employer trying to view another employer)
        try {
          final followResponse = await _followerRepository.isFollowed(widget.employerId);
          if (mounted) {
            setState(() {
              _isFollowing = followResponse.data ?? false;
            });
          }
        } catch (e) {
          // Silently fail - user doesn't have permission to follow
          // This is expected for employer viewing employer
          if (mounted) {
            setState(() {
              _isFollowing = false;
            });
          }
        }
        
        // Load jobs and related companies after profile is loaded
        await Future.wait([
          _loadJobs(),
          _loadRelatedCompanies(),
        ]);
        
        if (mounted) {
          setState(() {
            _isLoading = false;
          });
        }
      }
    } catch (e) {
      if (mounted) {
        setState(() => _isLoading = false);
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text('Failed to load profile: $e')));
      }
    }
  }

  Future<void> _loadJobs() async {
    try {
      final response = await _jobRepository.getJobByEmployerId(
        widget.employerId,
        page: 0,
        size: 10,
      );
      if (mounted) {
        setState(() {
          _jobs = response.data?.content ?? [];
        });
      }
    } catch (e) {
      // Silently fail for jobs
    }
  }

  Future<void> _loadRelatedCompanies() async {
    try {
      final response = await _repository.filterEmployerProfiles(
        page: 0,
        size: 10,
      );
      if (mounted) {
        setState(() {
          // Filter out current employer and take max 3
          final content = response.data?.content;
          if (content != null) {
            _relatedCompanies = content
                .where((company) => company.id != widget.employerId)
                .take(3)
                .toList();
          }
        });
      }
    } catch (e) {
      // Silently fail for related companies
    }
  }

  Future<void> _handleFollowToggle() async {
    if (_isFollowLoading) return;

    setState(() {
      _isFollowLoading = true;
    });

    try {
      if (_isFollowing) {
        await _followerRepository.unfollowEmployer(widget.employerId);
      } else {
        await _followerRepository.followEmployer(widget.employerId);
      }
      
      if (mounted) {
        setState(() {
          _isFollowing = !_isFollowing;
          _isFollowLoading = false;
        });
      }
    } catch (e) {
      if (mounted) {
        setState(() {
          _isFollowLoading = false;
        });
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(
          const SnackBar(
            content: Text('You cannot follow employers as an employer'),
            backgroundColor: Colors.red,
          ),
        );
      }
    }
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoading) {
      return const Scaffold(
        backgroundColor: AppColors.background,
        body: Center(child: CircularProgressIndicator()),
      );
    }

    if (_profile == null) {
      return Scaffold(
        backgroundColor: AppColors.background,
        appBar: AppBar(title: const Text('Employer Profile')),
        body: const Center(child: Text('Profile not found')),
      );
    }

    return Scaffold(
      backgroundColor: AppColors.background,
      body: Column(
        children: [
          _buildAppBar(),
          Expanded(
            child: NestedScrollView(
              headerSliverBuilder: (context, innerBoxIsScrolled) {
                return [
                  SliverToBoxAdapter(
                    child: Column(
                      children: [
                        _buildCompanyHeader(),
                        _buildFollowButton(),
                        _buildTabBar(),
                      ],
                    ),
                  ),
                ];
              },
              body: TabBarView(
                controller: _tabController,
                children: [
                  AboutTabWidget(
                    aboutUs: _profile!.about ?? 'No information available.',
                    vision: _profile!.vision ?? 'No vision statement available.',
                    website: _profile!.websiteUrl ?? 'N/A',
                    location: _profile!.province != null
                        ? (_profile!.district != null
                              ? '${_profile!.district!.name}, ${_profile!.province!.name}'
                              : _profile!.province!.name)
                        : 'Not specified',
                    relativeCompanies: _relatedCompanies.map((company) {
                      final companyLocation = company.province != null
                          ? (company.district != null
                                ? '${company.district!.name}, ${company.province!.name}'
                                : company.province!.name)
                          : 'Not specified';
                      
                      return RelativeCompanyCardData(
                        companyName: company.name,
                        industry: companyLocation,
                        employerId: company.id,
                        logoUrl: company.logoUrl,
                      );
                    }).toList(),
                    onCompanyTap: (employerId) {
                      if (employerId != null) {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => EmployerDetailPage(employerId: employerId),
                          ),
                        );
                      }
                    },
                  ),
                JobsTabWidget(
                    jobs: _jobs.map((job) {
                      final jobTimeAgo = job.createdAt != null 
                          ? _formatTimeAgo(DateTime.parse(job.createdAt!))
                          : 'Recently';
                      
                      return JobCardData(
                        title: job.title,
                        company: job.companyName ?? _profile!.name,
                        salary: _formatSalary(job),
                        time: jobTimeAgo,
                        jobId: job.id,
                        logoUrl: job.companyLogo,
                      );
                    }).toList(),
                    onJobTap: (jobId) {
                      if (jobId != null) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => JobDetailPage(jobId: jobId),
                          ),
                        );
                      }
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  String _formatTimeAgo(DateTime dateTime) {
    final now = DateTime.now();
    final difference = now.difference(dateTime);
    
    if (difference.inDays > 30) {
      return DateFormat('MMM dd, yyyy').format(dateTime);
    } else if (difference.inDays > 0) {
      return '${difference.inDays} day${difference.inDays > 1 ? 's' : ''} ago';
    } else if (difference.inHours > 0) {
      return '${difference.inHours} hour${difference.inHours > 1 ? 's' : ''} ago';
    } else if (difference.inMinutes > 0) {
      return '${difference.inMinutes} minute${difference.inMinutes > 1 ? 's' : ''} ago';
    } else {
      return 'Just now';
    }
  }

  String _formatSalary(JobDto job) {
    if (job.minSalary == null && job.maxSalary == null) {
      return 'Negotiable';
    }
    
    final currencySymbol = _getCurrencySymbol(job.currency);
    
    if (job.minSalary != null && job.maxSalary != null) {
      return '$currencySymbol${_formatNumber(job.minSalary!)} - $currencySymbol${_formatNumber(job.maxSalary!)}';
    } else if (job.minSalary != null) {
      return 'From $currencySymbol${_formatNumber(job.minSalary!)}';
    } else {
      return 'Up to $currencySymbol${_formatNumber(job.maxSalary!)}';
    }
  }

  String _getCurrencySymbol(Currency? currency) {
    switch (currency) {
      case Currency.usd:
        return '\$';
      case Currency.vnd:
        return '₫';
      case Currency.eur:
        return '€';
      case Currency.gbp:
        return '£';
      default:
        return '\$';
    }
  }

  String _formatNumber(double number) {
    final formatter = NumberFormat.compact();
    return formatter.format(number);
  }

  Widget _buildAppBar() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: SafeArea(
        bottom: false,
        child: Row(
          children: [
            GestureDetector(
              onTap: () => Navigator.pop(context),
              child: Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: AppColors.background,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Icon(
                  Icons.arrow_back,
                  size: 20,
                  color: AppColors.textPrimary,
                ),
              ),
            ),
            Expanded(
              child: Text(
                'Company Profile',
                style: AppTextStyles.heading3.copyWith(
                  color: AppColors.textPrimary,
                  fontWeight: FontWeight.w700,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(width: 36),
          ],
        ),
      ),
    );
  }

  Widget _buildCompanyHeader() {
    final location = _profile!.province != null
        ? (_profile!.district != null
              ? '${_profile!.district!.name}, ${_profile!.province!.name}'
              : _profile!.province!.name)
        : 'Not specified';

    final timeAgo = _profile!.createdAt != null 
        ? _formatTimeAgo(_profile!.createdAt!)
        : 'Recently';

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            AppColors.primary.withValues(alpha: 0.1),
            AppColors.secondary.withValues(alpha: 0.05),
          ],
        ),
      ),
      child: Column(
        children: [
          Container(
            width: 100,
            height: 100,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: AppColors.primary.withValues(alpha: 0.15),
                  blurRadius: 20,
                  offset: const Offset(0, 8),
                ),
              ],
              image: _profile!.logoUrl != null && _profile!.logoUrl!.isNotEmpty
                  ? DecorationImage(
                      image: NetworkImage(_profile!.logoUrl!),
                      fit: BoxFit.cover,
                    )
                  : null,
            ),
            child: _profile!.logoUrl == null || _profile!.logoUrl!.isEmpty
                ? const Icon(
                    Icons.business,
                    color: AppColors.primary,
                    size: 48,
                  )
                : null,
          ),
          const SizedBox(height: 16),
          Text(
            _profile!.name,
            style: AppTextStyles.heading2.copyWith(
              color: AppColors.textPrimary,
              fontWeight: FontWeight.w700,
              fontSize: 20,
            ),
            textAlign: TextAlign.center,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: 8),
          Text(
            'Technology',
            style: AppTextStyles.body.copyWith(
              color: AppColors.textSecondary,
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 12),
          Wrap(
            alignment: WrapAlignment.center,
            spacing: 8,
            runSpacing: 8,
            children: [
              _buildChip(Icons.location_on_outlined, location),
              _buildChip(Icons.access_time_outlined, timeAgo),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildChip(IconData icon, String text) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            size: 16,
            color: AppColors.primary,
          ),
          const SizedBox(width: 4),
          Text(
            text,
            style: AppTextStyles.caption.copyWith(
              color: AppColors.textSecondary,
              fontSize: 13,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFollowButton() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      child: SizedBox(
        width: double.infinity,
        child: ElevatedButton(
          onPressed: _isFollowLoading ? null : _handleFollowToggle,
          style: ElevatedButton.styleFrom(
            backgroundColor: _isFollowing 
                ? Colors.white 
                : AppColors.primary,
            padding: const EdgeInsets.symmetric(vertical: 14),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
              side: BorderSide(
                color: _isFollowing ? AppColors.primary : Colors.transparent,
                width: 1.5,
              ),
            ),
            elevation: 0,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (_isFollowLoading)
                SizedBox(
                  width: 18,
                  height: 18,
                  child: CircularProgressIndicator(
                    strokeWidth: 2,
                    valueColor: AlwaysStoppedAnimation<Color>(
                      _isFollowing ? AppColors.primary : Colors.white,
                    ),
                  ),
                )
              else
                Icon(
                  _isFollowing ? Icons.check_circle : Icons.add_circle,
                  size: 20,
                  color: _isFollowing ? AppColors.primary : Colors.white,
                ),
              const SizedBox(width: 8),
              Text(
                _isFollowing ? 'Following' : 'Follow Company',
                style: AppTextStyles.button.copyWith(
                  color: _isFollowing ? AppColors.primary : Colors.white,
                  fontSize: 15,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTabBar() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: TabBar(
        controller: _tabController,
        indicator: BoxDecoration(
          color: AppColors.primary,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: AppColors.primary.withValues(alpha: 0.3),
              blurRadius: 8,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        indicatorSize: TabBarIndicatorSize.tab,
        dividerColor: Colors.transparent,
        labelColor: Colors.white,
        unselectedLabelColor: AppColors.textSecondary,
        labelStyle: AppTextStyles.body.copyWith(
          fontWeight: FontWeight.w700,
          fontSize: 15,
        ),
        unselectedLabelStyle: AppTextStyles.body.copyWith(
          fontWeight: FontWeight.w600,
          fontSize: 15,
        ),
        tabs: const [
          Tab(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.info_outline, size: 18),
                SizedBox(width: 6),
                Text('About'),
              ],
            ),
          ),
          Tab(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.work_outline, size: 18),
                SizedBox(width: 6),
                Text('Jobs'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
