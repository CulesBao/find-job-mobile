import 'package:flutter/material.dart';
import 'package:find_job_mobile/shared/styles/colors.dart';
import 'package:find_job_mobile/shared/styles/text_styles.dart';

class JobCardData {
  final String title;
  final String company;
  final String salary;
  final String time;

  const JobCardData({
    required this.title,
    required this.company,
    required this.salary,
    required this.time,
  });
}

class JobCardWidget extends StatelessWidget {
  final JobCardData data;
  final VoidCallback? onTap;

  const JobCardWidget({super.key, required this.data, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: AppColors.textTertiary.withValues(alpha: 0.05),
              blurRadius: 8,
            ),
          ],
        ),
        child: Row(
          children: [
            Container(
              width: 56,
              height: 56,
              decoration: BoxDecoration(
                color: const Color(0xFFAFECFE),
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Icon(Icons.business, color: AppColors.primary),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    data.title,
                    style: AppTextStyles.body.copyWith(
                      color: const Color(0xFF150B3D),
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    data.company,
                    style: AppTextStyles.caption.copyWith(
                      color: const Color(0xFF524B6B),
                    ),
                  ),
                  const SizedBox(height: 6),
                  Row(
                    children: [
                      Text(
                        data.salary,
                        style: AppTextStyles.caption.copyWith(
                          color: const Color(0xFF524B6B),
                        ),
                      ),
                      const SizedBox(width: 6),
                      const Icon(
                        Icons.circle,
                        size: 6,
                        color: Color(0xFF524B6B),
                      ),
                      const SizedBox(width: 6),
                      Text(
                        data.time,
                        style: AppTextStyles.caption.copyWith(
                          color: const Color(0xFF524B6B),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
