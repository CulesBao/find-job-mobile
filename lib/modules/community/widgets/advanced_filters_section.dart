import 'package:find_job_mobile/shared/data/models/candidate_profile_dto.dart';
import 'package:find_job_mobile/shared/data/models/province_dto.dart';
import 'package:find_job_mobile/shared/styles/colors.dart';
import 'package:find_job_mobile/shared/styles/text_styles.dart';
import 'package:flutter/material.dart';

class CandidateAdvancedFilters extends StatelessWidget {
  const CandidateAdvancedFilters({
    super.key,
    this.lastNameController,
    this.selectedEducation,
    this.selectedGender,
    this.selectedProvince,
    this.provinces,
    this.onEducationChanged,
    this.onGenderChanged,
    this.onProvinceChanged,
    this.onClearFilters,
  });

  final TextEditingController? lastNameController;
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

  void _showEducationSelector(BuildContext context) {
    final educations = Education.values;

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => Container(
        height: MediaQuery.of(context).size.height * 0.6,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
        ),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: AppColors.textTertiary.withValues(alpha: 0.2),
                  ),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Select Education',
                    style: AppTextStyles.heading3.copyWith(
                      color: AppColors.textPrimary,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: const Icon(Icons.close),
                    color: AppColors.textSecondary,
                  ),
                ],
              ),
            ),

            if (selectedEducation != null)
              ListTile(
                leading: const Icon(Icons.clear, color: AppColors.error),
                title: Text(
                  'Clear selection',
                  style: AppTextStyles.body.copyWith(
                    color: AppColors.error,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                onTap: () {
                  onEducationChanged?.call(null);
                  Navigator.pop(context);
                },
              ),

            Expanded(
              child: ListView.builder(
                itemCount: educations.length,
                itemBuilder: (context, index) {
                  final edu = educations[index];
                  final isSelected = selectedEducation == edu;
                  return ListTile(
                    leading: Icon(
                      isSelected ? Icons.check_circle : Icons.school_outlined,
                      color: isSelected
                          ? AppColors.primary
                          : AppColors.textSecondary,
                    ),
                    title: Text(
                      _getEducationLabel(edu),
                      style: AppTextStyles.body.copyWith(
                        color: isSelected
                            ? AppColors.primary
                            : AppColors.textPrimary,
                      ),
                    ),
                    onTap: () {
                      onEducationChanged?.call(edu);
                      Navigator.pop(context);
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
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
              if (selectedEducation != null ||
                  selectedGender != null ||
                  selectedProvince != null)
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

          // Last Name Search
          Row(
            children: [
              const Icon(
                Icons.person_outline,
                size: 20,
                color: AppColors.textSecondary,
              ),
              const SizedBox(width: 8),
              Text(
                'Last Name',
                style: AppTextStyles.body.copyWith(
                  color: AppColors.textSecondary,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          TextField(
            controller: lastNameController,
            decoration: InputDecoration(
              hintText: 'Enter last name...',
              hintStyle: AppTextStyles.body.copyWith(
                color: AppColors.textSecondary,
              ),
              filled: true,
              fillColor: AppColors.background,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(
                  color: AppColors.textTertiary.withValues(alpha: 0.3),
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(
                  color: AppColors.textTertiary.withValues(alpha: 0.3),
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(color: AppColors.primary, width: 2),
              ),
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 12,
              ),
            ),
          ),
          const SizedBox(height: 16),

          // Education Filter (chip + bottom sheet like Find Job)
          Row(
            children: [
              const Icon(
                Icons.school_outlined,
                size: 20,
                color: AppColors.textSecondary,
              ),
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
          InkWell(
            onTap: () => _showEducationSelector(context),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              decoration: BoxDecoration(
                color: AppColors.background,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: selectedEducation != null
                      ? AppColors.primary
                      : AppColors.textTertiary.withValues(alpha: 0.3),
                  width: selectedEducation != null ? 2 : 1,
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    selectedEducation != null
                        ? _getEducationLabel(selectedEducation!)
                        : 'Select education level',
                    style: AppTextStyles.body.copyWith(
                      color: selectedEducation != null
                          ? AppColors.primary
                          : AppColors.textSecondary,
                      fontWeight: selectedEducation != null
                          ? FontWeight.w600
                          : FontWeight.normal,
                    ),
                  ),
                  Icon(
                    Icons.arrow_drop_down,
                    color: selectedEducation != null
                        ? AppColors.primary
                        : AppColors.textSecondary,
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 16),

          // Gender Filter
          Row(
            children: [
              const Icon(
                Icons.wc_outlined,
                size: 20,
                color: AppColors.textSecondary,
              ),
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
                  onTap: () => onGenderChanged?.call(
                    selectedGender == false ? null : false,
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: _buildGenderChip(
                  label: 'Female',
                  value: true, // Backend expects true for Female
                  isSelected: selectedGender == true,
                  onTap: () => onGenderChanged?.call(
                    selectedGender == true ? null : true,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),

          // Province Filter (chip + bottom sheet like Find Job)
          Row(
            children: [
              const Icon(
                Icons.location_on_outlined,
                size: 20,
                color: AppColors.textSecondary,
              ),
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
          InkWell(
            onTap: () => _showProvinceSelectorModal(
              context: context,
              provinces: provinces,
              selectedProvince: selectedProvince,
              onProvinceChanged: onProvinceChanged,
            ),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              decoration: BoxDecoration(
                color: AppColors.background,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: selectedProvince != null
                      ? AppColors.primary
                      : AppColors.textTertiary.withValues(alpha: 0.3),
                  width: selectedProvince != null ? 2 : 1,
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    selectedProvince?.name ?? 'Select province',
                    style: AppTextStyles.body.copyWith(
                      color: selectedProvince != null
                          ? AppColors.primary
                          : AppColors.textSecondary,
                      fontWeight: selectedProvince != null
                          ? FontWeight.w600
                          : FontWeight.normal,
                    ),
                  ),
                  Icon(
                    Icons.arrow_drop_down,
                    color: selectedProvince != null
                        ? AppColors.primary
                        : AppColors.textSecondary,
                  ),
                ],
              ),
            ),
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

// Helper modal for province selection used by both Candidate and Employer filters
void _showProvinceSelectorModal({
  required BuildContext context,
  required List<ProvinceDto>? provinces,
  required ProvinceDto? selectedProvince,
  required Function(ProvinceDto?)? onProvinceChanged,
}) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    builder: (context) => Container(
      height: MediaQuery.of(context).size.height * 0.6,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: AppColors.textTertiary.withValues(alpha: 0.2),
                ),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Select Province',
                  style: AppTextStyles.heading3.copyWith(
                    color: AppColors.textPrimary,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                IconButton(
                  onPressed: () => Navigator.pop(context),
                  icon: const Icon(Icons.close),
                  color: AppColors.textSecondary,
                ),
              ],
            ),
          ),

          if (selectedProvince != null)
            ListTile(
              leading: const Icon(Icons.clear, color: AppColors.error),
              title: Text(
                'Clear selection',
                style: AppTextStyles.body.copyWith(
                  color: AppColors.error,
                  fontWeight: FontWeight.w600,
                ),
              ),
              onTap: () {
                onProvinceChanged?.call(null);
                Navigator.pop(context);
              },
            ),

          Expanded(
            child: provinces == null || provinces.isEmpty
                ? const Center(child: CircularProgressIndicator())
                : ListView.builder(
                    itemCount: provinces.length,
                    itemBuilder: (context, index) {
                      final province = provinces[index];
                      final isSelected =
                          selectedProvince?.code == province.code;
                      return ListTile(
                        leading: Icon(
                          isSelected
                              ? Icons.check_circle
                              : Icons.location_on_outlined,
                          color: isSelected
                              ? AppColors.primary
                              : AppColors.textSecondary,
                        ),
                        title: Text(
                          province.name,
                          style: AppTextStyles.body.copyWith(
                            color: isSelected
                                ? AppColors.primary
                                : AppColors.textPrimary,
                          ),
                        ),
                        onTap: () {
                          onProvinceChanged?.call(province);
                          Navigator.pop(context);
                        },
                      );
                    },
                  ),
          ),
        ],
      ),
    ),
  );
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
              const Icon(
                Icons.location_on_outlined,
                size: 20,
                color: AppColors.textSecondary,
              ),
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
          InkWell(
            onTap: () => _showProvinceSelectorModal(
              context: context,
              provinces: provinces,
              selectedProvince: selectedProvince,
              onProvinceChanged: onProvinceChanged,
            ),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              decoration: BoxDecoration(
                color: AppColors.background,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: selectedProvince != null
                      ? AppColors.primary
                      : AppColors.textTertiary.withValues(alpha: 0.3),
                  width: selectedProvince != null ? 2 : 1,
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    selectedProvince?.name ?? 'Select province',
                    style: AppTextStyles.body.copyWith(
                      color: selectedProvince != null
                          ? AppColors.primary
                          : AppColors.textSecondary,
                      fontWeight: selectedProvince != null
                          ? FontWeight.w600
                          : FontWeight.normal,
                    ),
                  ),
                  Icon(
                    Icons.arrow_drop_down,
                    color: selectedProvince != null
                        ? AppColors.primary
                        : AppColors.textSecondary,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
