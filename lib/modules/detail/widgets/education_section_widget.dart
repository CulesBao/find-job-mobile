import 'package:flutter/material.dart';
import 'package:find_job_mobile/shared/styles/text_styles.dart';

class EducationSectionWidget extends StatelessWidget {
  final String education;

  const EducationSectionWidget({super.key, required this.education});

  String _getEducationLabel(String education) {
    switch (education) {
      case 'HIGH_SCHOOL':
        return 'High School';
      case 'INTERMEDIATE':
        return 'Intermediate';
      case 'GRADUATION':
        return 'Graduation';
      case 'BACHELOR_DEGREE':
        return 'Bachelor Degree';
      case 'MASTER_DEGREE':
        return 'Master Degree';
      default:
        return 'High School';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(6),
                decoration: BoxDecoration(
                  color: const Color(0xFFFF9228).withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(6),
                ),
                child: const Icon(
                  Icons.school_outlined,
                  color: Color(0xFFFF9228),
                  size: 18,
                ),
              ),
              const SizedBox(width: 10),
              Text(
                'Education',
                style: AppTextStyles.body.copyWith(
                  color: const Color(0xFF150B3D),
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Divider(color: Colors.grey[300], height: 1),
          const SizedBox(height: 20),
          Row(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 6,
                ),
                decoration: BoxDecoration(
                  color: const Color(0xFFFF9228).withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Text(
                  _getEducationLabel(education),
                  style: AppTextStyles.body.copyWith(
                    color: const Color(0xFFFF9228),
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
