import 'package:flutter/material.dart';
import 'package:find_job_mobile/shared/styles/text_styles.dart';

class JobInfoHeaderWidget extends StatelessWidget {
  final String jobTitle;
  final String company;
  final String location;
  final String timeAgo;
  final String? logoUrl;

  const JobInfoHeaderWidget({
    super.key,
    required this.jobTitle,
    required this.company,
    required this.location,
    required this.timeAgo,
    this.logoUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.only(bottom: 14),
      decoration: const BoxDecoration(color: Color(0xFFF2F2F2)),
      child: Column(
        children: [
          const SizedBox(height: 38),
          // Company Logo
          Container(
            width: 84,
            height: 84,
            decoration: BoxDecoration(
              color: const Color(0xFFAFECFE),
              borderRadius: BorderRadius.circular(48),
            ),
            child: Center(
              child: logoUrl != null
                  ? Container(
                      width: 54.6,
                      height: 54.6,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage(logoUrl!),
                          fit: BoxFit.contain,
                        ),
                      ),
                    )
                  : const Icon(
                      Icons.business,
                      size: 40,
                      color: Color(0xFF6C5CE7),
                    ),
            ),
          ),
          const SizedBox(height: 14),
          // Job Title
          Text(
            jobTitle,
            style: AppTextStyles.heading3.copyWith(
              color: const Color(0xFF0D0140),
              fontWeight: FontWeight.w700,
              fontSize: 16,
            ),
          ),
          const SizedBox(height: 14),
          // Company Info Row
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                company,
                style: AppTextStyles.body.copyWith(
                  color: const Color(0xFF0D0140),
                  fontSize: 16,
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 8),
                child: Icon(Icons.circle, size: 7, color: Color(0xFF0D0140)),
              ),
              Text(
                location,
                style: AppTextStyles.body.copyWith(
                  color: const Color(0xFF0D0140),
                  fontSize: 16,
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 8),
                child: Icon(Icons.circle, size: 7, color: Color(0xFF0D0140)),
              ),
              Text(
                timeAgo,
                style: AppTextStyles.body.copyWith(
                  color: const Color(0xFF0D0140),
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
