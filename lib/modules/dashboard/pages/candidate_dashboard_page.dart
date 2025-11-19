import 'package:find_job_mobile/modules/find_job/pages/find_job_page.dart';
import 'package:find_job_mobile/modules/dashboard/pages/saved_employers_page.dart';
import 'package:find_job_mobile/modules/detail/pages/job_detail_page.dart';
import 'package:find_job_mobile/modules/detail/pages/employer_detail_page.dart';
import 'package:flutter/material.dart';
import 'package:find_job_mobile/app/config/service_locator.dart';
import 'package:find_job_mobile/shared/data/dto/filter_job_request.dart';
import 'package:find_job_mobile/shared/data/models/job_dto.dart';
import 'package:find_job_mobile/shared/data/models/candidate_profile_dto.dart';
import 'package:find_job_mobile/shared/data/models/saved_employer_dto.dart';
import 'package:find_job_mobile/shared/data/repositories/job_repository.dart';
import 'package:find_job_mobile/shared/data/repositories/candidate_follower_repository.dart';
import 'package:find_job_mobile/shared/styles/colors.dart';
import 'package:find_job_mobile/shared/styles/text_styles.dart';
import 'package:find_job_mobile/shared/utils/auth_helper.dart';
import 'package:intl/intl.dart';

class CandidateDashboardPage extends StatefulWidget {
  const CandidateDashboardPage({super.key});

  @override
  State<CandidateDashboardPage> createState() => _CandidateDashboardPageState();
}

class _CandidateDashboardPageState extends State<CandidateDashboardPage> {
  final _jobRepository = getIt<JobRepository>();
  final _candidateFollowerRepository = getIt<CandidateFollowerRepository>();

  bool _isLoadingJobs = false;
  bool _isLoadingEmployers = false;
  List<JobDto> _jobs = [];
  List<SavedEmployerDto> _savedEmployers = [];
  String? _errorMessage;
  CandidateProfileDto? _candidateProfile;

  @override
  void initState() {
    super.initState();
    _loadProfile();
    _loadData();
  }

  Future<void> _loadProfile() async {
    // Try to get profile from AuthHelper first
    _candidateProfile = AuthHelper.candidateProfile;
    setState(() {});
  }

  Future<void> _loadData() async {
    await Future.wait([_loadJobs(), _loadSavedEmployers()]);
  }

  Future<void> _loadJobs() async {
    setState(() {
      _isLoadingJobs = true;
      _errorMessage = null;
    });

    try {
      final response = await _jobRepository.getJobByFilter(
        FilterJobRequest(),
        page: 0,
        size: 6,
      );

      if (response.success || response.data != null) {
        final jobs = response.data?.content ?? [];
        setState(() {
          _jobs = jobs;
        });
      } else {
        setState(() {
          _errorMessage = response.message;
        });
      }
    } catch (e) {
      setState(() {
        _errorMessage = 'Unable to load jobs. Please try again.';
      });
    } finally {
      setState(() {
        _isLoadingJobs = false;
      });
    }
  }

  Future<void> _loadSavedEmployers() async {
    setState(() {
      _isLoadingEmployers = true;
    });

    try {
      final response = await _candidateFollowerRepository.getFollowedEmployers(
        page: 0,
        size: 3,
      );

      if (response.success || response.data != null) {
        final content = response.data?.content ?? [];

        setState(() {
          _savedEmployers = content;
        });
      } else {
        setState(() {
          _savedEmployers = [];
        });
      }
    } catch (e) {
      setState(() {
        _savedEmployers = [];
      });
    } finally {
      setState(() {
        _isLoadingEmployers = false;
      });
    }
  }

  int _getDaysRemaining(String? expiredAt) {
    if (expiredAt == null) return 999;

    try {
      final expiredDate = DateTime.parse(expiredAt);
      final now = DateTime.now();
      final difference = expiredDate.difference(now);

      return difference.inDays > 0 ? difference.inDays : 0;
    } catch (e) {
      return 999;
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

  @override
  Widget build(BuildContext context) {
    final userName = _candidateProfile != null
        ? '${_candidateProfile!.firstName} ${_candidateProfile!.lastName}'
        : AuthHelper.currentUser?.email.split('@').first ?? 'User';

    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: RefreshIndicator(
          onRefresh: _loadData,
          child: SingleChildScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Welcome Header
                  _buildWelcomeHeader(userName),
                  const SizedBox(height: 32),

                  // Jobs Section
                  _buildJobsSection(),
                  const SizedBox(height: 32),

                  // Saved Employers Section
                  _buildSavedEmployersSection(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildWelcomeHeader(String userName) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Welcome,',
          style: AppTextStyles.body.copyWith(
            fontSize: 24,
            color: AppColors.textSecondary,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          userName,
          style: AppTextStyles.heading1.copyWith(
            color: AppColors.textPrimary,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }

  Widget _buildJobsSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Jobs',
          style: AppTextStyles.heading2.copyWith(
            color: AppColors.textPrimary,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 16),

        if (_isLoadingJobs)
          const Center(
            child: Padding(
              padding: EdgeInsets.all(32.0),
              child: CircularProgressIndicator(),
            ),
          )
        else if (_errorMessage != null)
          Center(
            child: Padding(
              padding: const EdgeInsets.all(32.0),
              child: Column(
                children: [
                  Icon(Icons.error_outline, size: 48, color: AppColors.error),
                  const SizedBox(height: 16),
                  Text(
                    _errorMessage!,
                    style: AppTextStyles.body.copyWith(color: AppColors.error),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 16),
                  ElevatedButton.icon(
                    onPressed: _loadJobs,
                    icon: const Icon(Icons.refresh),
                    label: const Text('Retry'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primary,
                      foregroundColor: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          )
        else if (_jobs.isEmpty)
          _buildEmptyState(
            icon: Icons.work_outline,
            title: 'No jobs available',
            subtitle: 'Check back later for new opportunities',
          )
        else
          SizedBox(
            height: 195,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: _jobs.isEmpty ? 0 : _jobs.length + 1,
              itemBuilder: (context, index) {
                if (index == _jobs.length) {
                  return _buildViewAllCard();
                }
                return _buildJobCard(_jobs[index]);
              },
            ),
          ),
      ],
    );
  }

  Widget _buildJobCard(JobDto job) {
    final daysRemaining = _getDaysRemaining(job.expiredAt);
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => JobDetailPage(jobId: job.id)),
        );
      },
      child: Container(
        width: 300,
        margin: const EdgeInsets.only(right: 12),
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: AppColors.textTertiary.withValues(alpha: 0.08),
              blurRadius: 8,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Top: Logo + Job Title
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Company Logo
                Container(
                  width: 48,
                  height: 48,
                  decoration: BoxDecoration(
                    color: AppColors.primary.withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(36),
                    image: job.companyLogo != null
                        ? DecorationImage(
                            image: NetworkImage(job.companyLogo!),
                            fit: BoxFit.cover,
                          )
                        : null,
                  ),
                  child: job.companyLogo == null
                      ? Icon(Icons.business, color: AppColors.primary, size: 24)
                      : null,
                ),
                const SizedBox(width: 12),

                // Job Title (right of logo)
                Expanded(
                  child: Text(
                    job.title,
                    style: AppTextStyles.heading3.copyWith(
                      color: AppColors.textPrimary,
                      fontWeight: FontWeight.bold,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),

            // Company Name + Location (below title)
            Row(
              children: [
                Expanded(
                  child: Text(
                    job.companyName ?? 'Company',
                    style: AppTextStyles.body.copyWith(
                      color: AppColors.textPrimary,
                      fontWeight: FontWeight.w600,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 4),
            Row(
              children: [
                Icon(
                  Icons.location_on_outlined,
                  size: 14,
                  color: AppColors.textSecondary,
                ),
                const SizedBox(width: 4),
                Expanded(
                  child: Text(
                    job.jobLocation ?? 'Vietnam',
                    style: AppTextStyles.body.copyWith(
                      color: AppColors.textSecondary,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),

            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: [
                // Salary badge
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: AppColors.success.withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Icons.payments_outlined,
                        size: 12,
                        color: AppColors.success,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        _formatSalary(job),
                        style: AppTextStyles.caption.copyWith(
                          color: AppColors.success,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),

                // Days Remaining badge
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: daysRemaining > 3
                        ? AppColors.success.withValues(alpha: 0.1)
                        : AppColors.accent.withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Icons.schedule,
                        size: 12,
                        color: daysRemaining > 3
                            ? AppColors.success
                            : AppColors.accent,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        '$daysRemaining days',
                        style: AppTextStyles.caption.copyWith(
                          color: daysRemaining > 3
                              ? AppColors.success
                              : AppColors.accent,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildViewAllCard() {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const FindJobPage()),
        );
      },
      child: Container(
        width: 180,
        margin: const EdgeInsets.only(right: 12),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: const Color.fromARGB(255, 191, 182, 227),
            width: 2,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 141, 116, 255),
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.arrow_forward,
                color: Colors.white,
                size: 32,
              ),
            ),
            const SizedBox(height: 16),
            Text(
              'View All Jobs',
              style: AppTextStyles.heading3.copyWith(
                color: AppColors.primary,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSavedEmployersSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Saved Employers',
              style: AppTextStyles.heading2.copyWith(
                color: AppColors.textPrimary,
                fontWeight: FontWeight.bold,
              ),
            ),
            if (_savedEmployers.isNotEmpty)
              TextButton.icon(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const SavedEmployersPage(),
                    ),
                  );
                },
                icon: const Icon(Icons.arrow_forward, size: 18),
                label: const Text('View All'),
                style: TextButton.styleFrom(foregroundColor: AppColors.primary),
              ),
          ],
        ),
        const SizedBox(height: 16),

        if (_isLoadingEmployers)
          const Center(
            child: Padding(
              padding: EdgeInsets.all(32.0),
              child: CircularProgressIndicator(),
            ),
          )
        else if (_savedEmployers.isEmpty)
          _buildEmptyState(
            icon: Icons.bookmark_outline,
            title: 'No saved employers',
            subtitle: 'Follow companies you\'re interested in',
          )
        else
          ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: _savedEmployers.length,
            separatorBuilder: (context, index) => const SizedBox(height: 12),
            itemBuilder: (context, index) {
              return _buildEmployerCard(_savedEmployers[index]);
            },
          ),
      ],
    );
  }

  Widget _buildEmployerCard(SavedEmployerDto employer) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => EmployerDetailPage(employerId: employer.id),
          ),
        );
      },
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: AppColors.textTertiary.withValues(alpha: 0.08),
              blurRadius: 8,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          children: [
            // Company Logo
            Container(
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                color: AppColors.primary.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(12),
                image: employer.logoUrl != null
                    ? DecorationImage(
                        image: NetworkImage(employer.logoUrl!),
                        fit: BoxFit.cover,
                      )
                    : null,
              ),
              child: employer.logoUrl == null
                  ? Icon(Icons.business, color: AppColors.primary, size: 30)
                  : null,
            ),
            const SizedBox(width: 16),

            // Company Info
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    employer.name,
                    style: AppTextStyles.heading3.copyWith(
                      color: AppColors.textPrimary,
                      fontWeight: FontWeight.bold,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 4),

                  // Location (just string now, not object)
                  Row(
                    children: [
                      Icon(
                        Icons.location_on_outlined,
                        size: 16,
                        color: AppColors.textSecondary,
                      ),
                      const SizedBox(width: 4),
                      Expanded(
                        child: Text(
                          employer.location, // Just a string like "Lai Chau"
                          style: AppTextStyles.body.copyWith(
                            color: AppColors.textSecondary,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            // Follow button
            IconButton(
              onPressed: () async {
                try {
                  await _candidateFollowerRepository.unfollowEmployer(
                    employer.id,
                  );
                  if (mounted) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Unfollowed ${employer.name}')),
                    );
                    // Refresh the list
                    _loadSavedEmployers();
                  }
                } catch (e) {
                  if (mounted) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Failed to unfollow: ${e.toString()}'),
                      ),
                    );
                  }
                }
              },
              icon: const Icon(Icons.bookmark, color: AppColors.primary),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildEmptyState({
    required IconData icon,
    required String title,
    required String subtitle,
  }) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: AppColors.primary.withValues(alpha: 0.1),
                shape: BoxShape.circle,
              ),
              child: Icon(icon, size: 48, color: AppColors.primary),
            ),
            const SizedBox(height: 16),
            Text(
              title,
              style: AppTextStyles.heading3.copyWith(
                color: AppColors.textPrimary,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              subtitle,
              style: AppTextStyles.body.copyWith(
                color: AppColors.textSecondary,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
