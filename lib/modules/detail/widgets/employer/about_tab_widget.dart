import 'package:flutter/material.dart';
import 'package:find_job_mobile/shared/styles/text_styles.dart';
import 'package:find_job_mobile/modules/detail/widgets/employer/relative_company_card_widget.dart';

class AboutTabWidget extends StatelessWidget {
  final String aboutUs;
  final String vision;
  final String website;
  final String location;
  final List<RelativeCompanyCardData> relativeCompanies;

  const AboutTabWidget({
    super.key,
    required this.aboutUs,
    required this.vision,
    required this.website,
    required this.location,
    required this.relativeCompanies,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // About Us Section
          Text(
            'About Us',
            style: AppTextStyles.heading3.copyWith(
              color: const Color(0xFF150B3D),
              fontWeight: FontWeight.w700,
              fontSize: 14,
            ),
          ),
          const SizedBox(height: 12),
          Text(
            aboutUs,
            style: AppTextStyles.body.copyWith(
              color: const Color(0xFF524B6B),
              fontSize: 12,
              height: 1.5,
            ),
          ),
          const SizedBox(height: 24),

          // Our Vision Section
          Text(
            'Our Vision',
            style: AppTextStyles.heading3.copyWith(
              color: const Color(0xFF150B3D),
              fontWeight: FontWeight.w700,
              fontSize: 14,
            ),
          ),
          const SizedBox(height: 12),
          Text(
            vision,
            style: AppTextStyles.body.copyWith(
              color: const Color(0xFF524B6B),
              fontSize: 12,
              height: 1.5,
            ),
          ),
          const SizedBox(height: 24),

          // Website
          _buildInfoField('Website', website, isLink: true),
          const SizedBox(height: 20),

          // Location
          _buildInfoField('Location', location),
          const SizedBox(height: 24),

          // Relative Company Section
          Text(
            'Relative Company',
            style: AppTextStyles.heading3.copyWith(
              color: const Color(0xFF150B3D),
              fontWeight: FontWeight.w700,
              fontSize: 14,
            ),
          ),
          const SizedBox(height: 12),
          ...relativeCompanies.asMap().entries.map((entry) {
            final index = entry.key;
            final company = entry.value;
            return Padding(
              padding: EdgeInsets.only(
                bottom: index < relativeCompanies.length - 1 ? 12 : 0,
              ),
              child: RelativeCompanyCardWidget(data: company),
            );
          }),
        ],
      ),
    );
  }

  Widget _buildInfoField(String label, String value, {bool isLink = false}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: AppTextStyles.body.copyWith(
            color: const Color(0xFF150B3D),
            fontSize: 14,
            fontWeight: FontWeight.w700,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          value,
          style: AppTextStyles.body.copyWith(
            color: isLink ? const Color(0xFFFF9228) : const Color(0xFF524B6B),
            fontSize: 12,
          ),
        ),
      ],
    );
  }
}
