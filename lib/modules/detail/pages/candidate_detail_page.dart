import 'package:flutter/material.dart';
import 'package:find_job_mobile/app/config/service_locator.dart';
import 'package:find_job_mobile/shared/data/models/candidate_profile_dto.dart';
import 'package:find_job_mobile/shared/data/models/candidate_filter_dto.dart';
import 'package:find_job_mobile/shared/data/repositories/candidate_profile_repository.dart';
import 'package:find_job_mobile/shared/data/repositories/employer_follower_repository.dart';
import 'package:find_job_mobile/shared/styles/colors.dart';
import 'package:find_job_mobile/shared/styles/text_styles.dart';
import 'package:find_job_mobile/modules/detail/widgets/about_me_section_widget.dart';
import 'package:find_job_mobile/modules/detail/widgets/contact_info_section_widget.dart';
import 'package:find_job_mobile/modules/detail/widgets/education_section_widget.dart';
import 'package:find_job_mobile/modules/detail/widgets/relative_candidates_section_widget.dart';

class CandidateDetailPage extends StatefulWidget {
  final String candidateId;

  const CandidateDetailPage({super.key, required this.candidateId});

  @override
  State<CandidateDetailPage> createState() => _CandidateDetailPageState();
}

class _CandidateDetailPageState extends State<CandidateDetailPage> {
  bool _isLoading = true;
  bool _isFollowing = false;
  bool _isFollowLoading = false;
  CandidateProfileDto? _profile;
  List<CandidateFilterDto> _relatedCandidates = [];
  final _repository = getIt<CandidateProfileRepository>();
  final _followerRepository = getIt<EmployerFollowerRepository>();

  @override
  void initState() {
    super.initState();
    _loadProfile();
  }

  Future<void> _loadProfile() async {
    try {
      final response = await _repository.getProfile(widget.candidateId);
      
      if (mounted) {
        setState(() {
          _profile = response.data;
        });
        
        // Try to check follow status, but don't fail if it errors
        // (e.g., candidate trying to view another candidate)
        try {
          final followResponse = await _followerRepository.isFollowed(widget.candidateId);
          if (mounted) {
            setState(() {
              _isFollowing = followResponse.data ?? false;
            });
          }
        } catch (e) {
          // Silently fail - user doesn't have permission to follow
          // This is expected for candidate viewing candidate
          if (mounted) {
            setState(() {
              _isFollowing = false;
            });
          }
        }
        
        // Load related candidates after profile is loaded
        await _loadRelatedCandidates();
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

  Future<void> _loadRelatedCandidates() async {
    try {
      final response = await _repository.filterCandidateProfiles(
        page: 0,
        size: 10,
      );
      if (mounted) {
        setState(() {
          // Filter out current candidate and take max 3
          final content = response.data?.content;
          if (content != null) {
            _relatedCandidates = content
                .where((candidate) => candidate.id != widget.candidateId)
                .take(3)
                .toList();
          }
          _isLoading = false;
        });
      }
    } catch (e) {
      if (mounted) {
        setState(() => _isLoading = false);
      }
    }
  }

  Future<void> _handleFollowToggle() async {
    if (_isFollowLoading) return;

    setState(() {
      _isFollowLoading = true;
    });

    try {
      if (_isFollowing) {
        await _followerRepository.unfollowCandidate(widget.candidateId);
      } else {
        await _followerRepository.followCandidate(widget.candidateId);
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
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('You cannot follow candidates as a candidate'),
            backgroundColor: Colors.red,
          ),
        );
      }
    }
  }

  String _getEducationLabel(Education? education) {
    switch (education) {
      case Education.highSchool:
        return 'High School';
      case Education.intermediate:
        return 'Intermediate';
      case Education.graduation:
        return 'Graduation';
      case Education.bachelorDegree:
        return 'Bachelor Degree';
      case Education.masterDegree:
        return 'Master Degree';
      default:
        return 'Not specified';
    }
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
        appBar: AppBar(title: const Text('Candidate Profile')),
        body: const Center(child: Text('Profile not found')),
      );
    }

    return Scaffold(
      backgroundColor: AppColors.background,
      body: Column(
        children: [
          _buildAppBar(),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  _buildProfileHeader(),
                  _buildFollowButton(),
                  const SizedBox(height: 20),
                  AboutMeSectionWidget(
              description: _profile!.bio ?? 'No bio available',
            ),
            const SizedBox(height: 15),
            ContactInfoSectionWidget(
              phoneNumber: _profile!.phoneNumber ?? 'Not provided',
              socialLinks:
                  _profile!.socialLinks?.map((link) {
                    return SocialLinkData(
                      icon: Icons.link,
                      label: link.type.name,
                      value: link.url,
                      color: const Color(0xFF0077B5),
                    );
                  }).toList() ??
                  const [
                    SocialLinkData(
                      icon: Icons.work,
                      label: 'LinkedIn',
                      value: 'linkedin.com/in/orlandodiggs',
                      color: Color(0xFF0077B5),
                    ),
                    SocialLinkData(
                      icon: Icons.tag,
                      label: 'Twitter',
                      value: '@orlandodiggs',
                      color: Color(0xFF1DA1F2),
                    ),
                    SocialLinkData(
                      icon: Icons.code,
                      label: 'GitHub',
                      value: 'github.com/orlandodiggs',
                      color: Color(0xFF333333),
                    ),
                    SocialLinkData(
                      icon: Icons.language,
                      label: 'Website',
                      value: 'orlandodiggs.com',
                      color: Color(0xFFFF9228),
                    ),
                  ],
            ),
            const SizedBox(height: 15),
            EducationSectionWidget(
              education: _getEducationLabel(_profile!.education),
            ),
            const SizedBox(height: 15),
            RelativeCandidatesSectionWidget(
              candidates: _relatedCandidates.map((candidate) {
                return CandidateCardData(
                  name: '${candidate.firstName} ${candidate.lastName}',
                  position: _getEducationLabel(candidate.education),
                  location: candidate.location ?? 'Not specified',
                  candidateId: candidate.id,
                  avatarUrl: candidate.avatarUrl,
                );
              }).toList(),
              onCandidateTap: (candidateId) {
                if (candidateId != null) {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CandidateDetailPage(candidateId: candidateId),
                    ),
                  );
                }
              },
            ),
            const SizedBox(height: 100), // Space for bottom navigation
          ],
        ),
      ),
      ),
        ],
      ),
    );
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
                'Candidate Profile',
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

  Widget _buildProfileHeader() {
    final fullName = '${_profile!.firstName} ${_profile!.lastName}';
    final location = _profile!.province != null
        ? (_profile!.district != null
              ? '${_profile!.district!.name}, ${_profile!.province!.name}'
              : _profile!.province!.name)
        : 'Not specified';

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
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: _profile!.avatarUrl != null && _profile!.avatarUrl!.isNotEmpty
                  ? Image.network(
                      _profile!.avatarUrl!,
                      width: 100,
                      height: 100,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                        return const Icon(
                          Icons.person,
                          color: AppColors.primary,
                          size: 48,
                        );
                      },
                      loadingBuilder: (context, child, loadingProgress) {
                        if (loadingProgress == null) return child;
                        return Center(
                          child: CircularProgressIndicator(
                            value: loadingProgress.expectedTotalBytes != null
                                ? loadingProgress.cumulativeBytesLoaded /
                                    loadingProgress.expectedTotalBytes!
                                : null,
                            color: AppColors.primary,
                          ),
                        );
                      },
                    )
                  : const Icon(
                      Icons.person,
                      color: AppColors.primary,
                      size: 48,
                    ),
            ),
          ),
          const SizedBox(height: 16),
          Text(
            fullName,
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
            _getEducationLabel(_profile!.education),
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
              if (_profile!.phoneNumber != null)
                _buildChip(Icons.phone_outlined, _profile!.phoneNumber!),
            ],
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
        height: 50,
        child: ElevatedButton(
          onPressed: _isFollowLoading ? null : _handleFollowToggle,
          style: ElevatedButton.styleFrom(
            backgroundColor: _isFollowing ? Colors.white : AppColors.primary,
            foregroundColor: _isFollowing ? AppColors.primary : Colors.white,
            side: _isFollowing
                ? const BorderSide(color: AppColors.primary, width: 2)
                : null,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            elevation: _isFollowing ? 0 : 2,
          ),
          child: _isFollowLoading
              ? SizedBox(
                  height: 20,
                  width: 20,
                  child: CircularProgressIndicator(
                    strokeWidth: 2,
                    valueColor: AlwaysStoppedAnimation<Color>(
                      _isFollowing ? AppColors.primary : Colors.white,
                    ),
                  ),
                )
              : Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      _isFollowing ? Icons.check_circle : Icons.person_add,
                      size: 20,
                    ),
                    const SizedBox(width: 8),
                    Text(
                      _isFollowing ? 'Following' : 'Follow',
                      style: AppTextStyles.body.copyWith(
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
        ),
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
}
