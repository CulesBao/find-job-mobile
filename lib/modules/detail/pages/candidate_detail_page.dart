import 'package:flutter/material.dart';
import 'package:find_job_mobile/shared/styles/colors.dart';
import 'package:find_job_mobile/modules/detail/widgets/profile_header_widget.dart';
import 'package:find_job_mobile/modules/detail/widgets/about_me_section_widget.dart';
import 'package:find_job_mobile/modules/detail/widgets/contact_info_section_widget.dart';
import 'package:find_job_mobile/modules/detail/widgets/education_section_widget.dart';
import 'package:find_job_mobile/modules/detail/widgets/relative_candidates_section_widget.dart';

class CandidateDetailPage extends StatefulWidget {
  const CandidateDetailPage({super.key});

  @override
  State<CandidateDetailPage> createState() => _CandidateDetailPageState();
}

class _CandidateDetailPageState extends State<CandidateDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SingleChildScrollView(
        child: Column(
          children: [
            ProfileHeaderWidget(
              name: 'Orlando Diggs',
              location: 'California, USA',
              phoneNumber: '+1 234 567 890',
              followerCount: '120k',
              followingCount: '23k',
              onShareTap: () {
                // Handle share
              },
              onSettingsTap: () {
                // Handle settings
              },
            ),
            const SizedBox(height: 20),
            const AboutMeSectionWidget(
              description:
                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Lectus id commodo egestas metus interdum dolor.',
            ),
            const SizedBox(height: 15),
            ContactInfoSectionWidget(
              phoneNumber: '+1 234 567 890',
              socialLinks: const [
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
            const EducationSectionWidget(education: 'BACHELOR_DEGREE'),
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
