import 'package:flutter/material.dart';
import 'package:find_job_mobile/app/config/service_locator.dart';
import 'package:find_job_mobile/shared/data/models/candidate_profile_dto.dart';
import 'package:find_job_mobile/shared/data/repositories/candidate_profile_repository.dart';
import 'package:find_job_mobile/shared/styles/colors.dart';
import 'package:find_job_mobile/modules/detail/widgets/profile_header_widget.dart';
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
  CandidateProfileDto? _profile;
  final _repository = getIt<CandidateProfileRepository>();

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
          _isLoading = false;
        });
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

    final fullName = '${_profile!.firstName} ${_profile!.lastName}';
    final location = _profile!.province != null
        ? (_profile!.district != null
              ? '${_profile!.district!.name}, ${_profile!.province!.name}'
              : _profile!.province!.name)
        : 'Not specified';

    return Scaffold(
      backgroundColor: AppColors.background,
      body: SingleChildScrollView(
        child: Column(
          children: [
            ProfileHeaderWidget(
              name: fullName,
              location: location,
              phoneNumber: _profile!.phoneNumber ?? 'Not provided',
              followerCount: '0', // TODO: Add follower count from API
              followingCount: '0', // TODO: Add following count from API
              // TODO: Add avatarUrl support to ProfileHeaderWidget
              onShareTap: () {
                // Handle share
              },
              onSettingsTap: () {
                // Handle settings
              },
            ),
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
            const RelativeCandidatesSectionWidget(
              candidates: [
                CandidateCardData(
                  name: 'John Doe',
                  position: 'UI/UX Designer',
                  location: 'California, USA',
                ),
                CandidateCardData(
                  name: 'Jane Smith',
                  position: 'Product Manager',
                  location: 'New York, USA',
                ),
                CandidateCardData(
                  name: 'Mike Johnson',
                  position: 'Full Stack Developer',
                  location: 'Texas, USA',
                ),
              ],
            ),
            const SizedBox(height: 100), // Space for bottom navigation
          ],
        ),
      ),
    );
  }
}
