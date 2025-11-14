import 'package:find_job_mobile/shared/data/models/candidate_profile_dto.dart';
import 'package:find_job_mobile/shared/data/models/province_dto.dart';
import 'package:find_job_mobile/shared/styles/colors.dart';
import 'package:find_job_mobile/shared/styles/text_styles.dart';
import 'package:flutter/material.dart';

class CandidateAdvancedFilters extends StatelessWidget {
  const CandidateAdvancedFilters({
    super.key,
    this.selectedEducation,
    this.selectedGender,
    this.selectedProvince,
    this.provinces,
    this.onEducationChanged,
    this.onGenderChanged,
    this.onProvinceChanged,
    this.onClearFilters,
  });

  final Education? selectedEducation;
  final bool? selectedGender;
  final ProvinceDto? selectedProvince;
  final List<ProvinceDto>? provinces;
  final Function(Education?)? onEducationChanged;
  final Function(bool?)? onGenderChanged;
  final Function(ProvinceDto?)? onProvinceChanged;
  final VoidCallback? onClearFilters;

  String _getEducationLabel(Education education) {
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
    }
  }

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
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Advanced Filters',
                style: AppTextStyles.heading3.copyWith(
                  color: AppColors.textPrimary,
                ),
              ),
              if (selectedEducation != null || selectedGender != null || selectedProvince != null)
                TextButton(
                  onPressed: onClearFilters,
                  child: Text(
                    'Clear',
                    style: AppTextStyles.body.copyWith(
                      color: AppColors.error,
                      fontSize: 14,
                    ),
                  ),
                ),
            ],
          ),
          const SizedBox(height: 16),
          
          // Education Filter
          Row(
            children: [
              const Icon(Icons.school_outlined, size: 20, color: AppColors.textSecondary),
              const SizedBox(width: 8),
              Text(
                'Education',
                style: AppTextStyles.body.copyWith(
                  color: AppColors.textSecondary,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          DropdownButtonFormField<Education>(
            value: selectedEducation,
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(color: AppColors.textTertiary.withValues(alpha: 0.3)),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(color: AppColors.textTertiary.withValues(alpha: 0.3)),
              ),
            ),
            hint: Text(
              'Select education level',
              style: AppTextStyles.body.copyWith(
                color: AppColors.textTertiary,
                fontSize: 14,
              ),
            ),
            items: Education.values.map((education) {
              return DropdownMenuItem(
                value: education,
                child: Text(
                  _getEducationLabel(education),
                  style: AppTextStyles.body.copyWith(fontSize: 14),
                ),
              );
            }).toList(),
            onChanged: onEducationChanged,
          ),
          const SizedBox(height: 16),
          
          // Gender Filter
          Row(
            children: [
              const Icon(Icons.wc_outlined, size: 20, color: AppColors.textSecondary),
              const SizedBox(width: 8),
              Text(
                'Gender',
                style: AppTextStyles.body.copyWith(
                  color: AppColors.textSecondary,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              Expanded(
                child: _buildGenderChip(
                  label: 'Male',
                  value: false, // Backend expects false for Male
                  isSelected: selectedGender == false,
                  onTap: () => onGenderChanged?.call(selectedGender == false ? null : false),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: _buildGenderChip(
                  label: 'Female',
                  value: true, // Backend expects true for Female
                  isSelected: selectedGender == true,
                  onTap: () => onGenderChanged?.call(selectedGender == true ? null : true),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          
          // Province Filter
          Row(
            children: [
              const Icon(Icons.location_on_outlined, size: 20, color: AppColors.textSecondary),
              const SizedBox(width: 8),
              Text(
                'Province',
                style: AppTextStyles.body.copyWith(
                  color: AppColors.textSecondary,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          DropdownButtonFormField<String>(
            value: selectedProvince?.code,
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(color: AppColors.textTertiary.withValues(alpha: 0.3)),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(color: AppColors.textTertiary.withValues(alpha: 0.3)),
              ),
            ),
            hint: Text(
              'Select province',
              style: AppTextStyles.body.copyWith(
                color: AppColors.textTertiary,
                fontSize: 14,
              ),
            ),
            items: provinces?.map((province) {
              return DropdownMenuItem(
                value: province.code,
                child: Text(
                  province.name,
                  style: AppTextStyles.body.copyWith(fontSize: 14),
                ),
              );
            }).toList() ?? [],
            onChanged: (code) {
              final province = provinces?.firstWhere((p) => p.code == code);
              onProvinceChanged?.call(province);
            },
          ),
        ],
      ),
    );
  }

  Widget _buildGenderChip({
    required String label,
    required bool value,
    required bool isSelected,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(8),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
        decoration: BoxDecoration(
          color: isSelected 
              ? AppColors.primary.withValues(alpha: 0.1)
              : Colors.grey.withValues(alpha: 0.1),
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: isSelected 
                ? AppColors.primary
                : Colors.grey.withValues(alpha: 0.3),
            width: isSelected ? 2 : 1,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              value ? Icons.male : Icons.female,
              size: 18,
              color: isSelected ? AppColors.primary : AppColors.textSecondary,
            ),
            const SizedBox(width: 6),
            Text(
              label,
              style: AppTextStyles.body.copyWith(
                color: isSelected ? AppColors.primary : AppColors.textSecondary,
                fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
                fontSize: 14,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class EmployerAdvancedFilters extends StatelessWidget {
  const EmployerAdvancedFilters({
    super.key,
    this.selectedProvince,
    this.provinces,
    this.onProvinceChanged,
    this.onClearFilters,
  });

  final ProvinceDto? selectedProvince;
  final List<ProvinceDto>? provinces;
  final Function(ProvinceDto?)? onProvinceChanged;
  final VoidCallback? onClearFilters;

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
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Advanced Filters',
                style: AppTextStyles.heading3.copyWith(
                  color: AppColors.textPrimary,
                ),
              ),
              if (selectedProvince != null)
                TextButton(
                  onPressed: onClearFilters,
                  child: Text(
                    'Clear',
                    style: AppTextStyles.body.copyWith(
                      color: AppColors.error,
                      fontSize: 14,
                    ),
                  ),
                ),
            ],
          ),
          const SizedBox(height: 16),
          
          // Province Filter
          Row(
            children: [
              const Icon(Icons.location_on_outlined, size: 20, color: AppColors.textSecondary),
              const SizedBox(width: 8),
              Text(
                'Province',
                style: AppTextStyles.body.copyWith(
                  color: AppColors.textSecondary,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          DropdownButtonFormField<String>(
            value: selectedProvince?.code,
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(color: AppColors.textTertiary.withValues(alpha: 0.3)),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(color: AppColors.textTertiary.withValues(alpha: 0.3)),
              ),
            ),
            hint: Text(
              'Select province',
              style: AppTextStyles.body.copyWith(
                color: AppColors.textTertiary,
                fontSize: 14,
              ),
            ),
            items: provinces?.map((province) {
              return DropdownMenuItem(
                value: province.code,
                child: Text(
                  province.name,
                  style: AppTextStyles.body.copyWith(fontSize: 14),
                ),
              );
            }).toList() ?? [],
            onChanged: (code) {
              final province = provinces?.firstWhere((p) => p.code == code);
              onProvinceChanged?.call(province);
            },
          ),
        ],
      ),
    );
  }
}
