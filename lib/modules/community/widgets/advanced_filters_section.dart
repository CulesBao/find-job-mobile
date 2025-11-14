import 'package:find_job_mobile/modules/community/widgets/filter_row.dart';
import 'package:find_job_mobile/shared/styles/colors.dart';
import 'package:find_job_mobile/shared/styles/text_styles.dart';
import 'package:flutter/material.dart';

class CandidateAdvancedFilters extends StatelessWidget {
  const CandidateAdvancedFilters({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: AppColors.textTertiary.withValues(alpha: 0.08),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Advanced Filters',
            style: AppTextStyles.heading3.copyWith(
              color: AppColors.textPrimary,
            ),
          ),
          const SizedBox(height: 16),
          const FilterRow(
            label: 'Education',
            selectedValue: null,
            icon: Icons.school_outlined,
          ),
          const SizedBox(height: 12),
          const FilterRow(
            label: 'Gender',
            selectedValue: null,
            icon: Icons.wc_outlined,
          ),
          const SizedBox(height: 12),
          const FilterRow(
            label: 'Location',
            selectedValue: null,
            icon: Icons.location_on_outlined,
          ),
        ],
      ),
    );
  }
}

class EmployerAdvancedFilters extends StatelessWidget {
  const EmployerAdvancedFilters({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: AppColors.textTertiary.withValues(alpha: 0.08),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Advanced Filters',
            style: AppTextStyles.heading3.copyWith(
              color: AppColors.textPrimary,
            ),
          ),
          const SizedBox(height: 16),
          const FilterRow(
            label: 'Location',
            selectedValue: null,
            icon: Icons.location_on_outlined,
          ),
        ],
      ),
    );
  }
}
