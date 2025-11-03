import 'package:find_job_mobile/shared/styles/colors.dart';
import 'package:find_job_mobile/shared/styles/text_styles.dart';
import 'package:flutter/material.dart';

class SearchBarWidget extends StatelessWidget {
  const SearchBarWidget({
    super.key,
    required this.searchController,
    required this.showAdvancedFilters,
    required this.onToggleFilters,
    required this.onSearch,
    this.selectedProvince,
    this.selectedJobType,
    this.selectedEducation,
    this.selectedSalaryType,
  });

  final TextEditingController searchController;
  final bool showAdvancedFilters;
  final VoidCallback onToggleFilters;
  final VoidCallback onSearch;
  final String? selectedProvince;
  final String? selectedJobType;
  final String? selectedEducation;
  final String? selectedSalaryType;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
      padding: const EdgeInsets.all(22),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(28),
        boxShadow: [
          BoxShadow(
            color: AppColors.textTertiary.withValues(alpha: 0.12),
            blurRadius: 26,
            offset: const Offset(0, 16),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _SearchInput(controller: searchController),
          _AdvancedFiltersSection(
            showFilters: showAdvancedFilters,
            selectedProvince: selectedProvince,
            selectedJobType: selectedJobType,
            selectedEducation: selectedEducation,
            selectedSalaryType: selectedSalaryType,
          ),
          const SizedBox(height: 22),
          _SearchActions(
            showAdvancedFilters: showAdvancedFilters,
            onToggleFilters: onToggleFilters,
            onSearch: onSearch,
          ),
        ],
      ),
    );
  }
}

class _SearchInput extends StatelessWidget {
  const _SearchInput({required this.controller});

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 16),
      decoration: BoxDecoration(
        color: AppColors.background,
        borderRadius: BorderRadius.circular(22),
        border: Border.all(color: AppColors.secondary.withValues(alpha: 0.4)),
      ),
      child: Row(
        children: [
          const Icon(Icons.search, color: AppColors.primary, size: 24),
          const SizedBox(width: 14),
          Expanded(
            child: TextField(
              controller: controller,
              cursorColor: AppColors.primary,
              style: AppTextStyles.body.copyWith(
                color: AppColors.textPrimary,
                fontWeight: FontWeight.w600,
              ),
              decoration: InputDecoration(
                isDense: true,
                contentPadding: EdgeInsets.zero,
                hintText: 'Job title, keyword, company',
                hintStyle: AppTextStyles.body.copyWith(
                  color: AppColors.textTertiary,
                ),
                border: InputBorder.none,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _AdvancedFiltersSection extends StatelessWidget {
  const _AdvancedFiltersSection({
    required this.showFilters,
    this.selectedProvince,
    this.selectedJobType,
    this.selectedEducation,
    this.selectedSalaryType,
  });

  final bool showFilters;
  final String? selectedProvince;
  final String? selectedJobType;
  final String? selectedEducation;
  final String? selectedSalaryType;

  @override
  Widget build(BuildContext context) {
    return AnimatedSize(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
      child: showFilters
          ? Column(
              children: [
                const SizedBox(height: 16),
                _FilterRow(
                  label: 'Location',
                  selectedValue: selectedProvince,
                  icon: Icons.location_on_outlined,
                ),
                const SizedBox(height: 12),
                _FilterRow(
                  label: 'Job Type',
                  selectedValue: selectedJobType,
                  icon: Icons.work_outline,
                ),
                const SizedBox(height: 12),
                _FilterRow(
                  label: 'Education',
                  selectedValue: selectedEducation,
                  icon: Icons.school_outlined,
                ),
                const SizedBox(height: 12),
                _FilterRow(
                  label: 'Salary Type',
                  selectedValue: selectedSalaryType,
                  icon: Icons.payments_outlined,
                ),
              ],
            )
          : const SizedBox.shrink(),
    );
  }
}

class _FilterRow extends StatelessWidget {
  const _FilterRow({
    required this.label,
    required this.selectedValue,
    required this.icon,
  });

  final String label;
  final String? selectedValue;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 16),
      decoration: BoxDecoration(
        color: AppColors.background,
        borderRadius: BorderRadius.circular(22),
        border: Border.all(color: AppColors.secondary.withValues(alpha: 0.4)),
      ),
      child: Row(
        children: [
          Icon(icon, color: AppColors.primary, size: 24),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: AppTextStyles.caption.copyWith(
                    color: AppColors.textSecondary,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 0.4,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  selectedValue ?? 'Select $label',
                  style: AppTextStyles.body.copyWith(
                    color: AppColors.textPrimary,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
          const Icon(
            Icons.expand_more,
            color: AppColors.textSecondary,
            size: 20,
          ),
        ],
      ),
    );
  }
}

class _SearchActions extends StatelessWidget {
  const _SearchActions({
    required this.showAdvancedFilters,
    required this.onToggleFilters,
    required this.onSearch,
  });

  final bool showAdvancedFilters;
  final VoidCallback onToggleFilters;
  final VoidCallback onSearch;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        if (!showAdvancedFilters)
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '20k+ jobs available',
                  style: AppTextStyles.heading3.copyWith(
                    color: AppColors.textPrimary,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  'Find your dream job now',
                  style: AppTextStyles.body.copyWith(
                    color: AppColors.textSecondary,
                  ),
                ),
              ],
            ),
          ),
        if (showAdvancedFilters) const Spacer(),
        _FilterButton(
          isActive: showAdvancedFilters,
          onPressed: onToggleFilters,
        ),
        const SizedBox(width: 12),
        _SearchButton(onPressed: onSearch),
      ],
    );
  }
}

class _FilterButton extends StatelessWidget {
  const _FilterButton({required this.isActive, required this.onPressed});

  final bool isActive;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 52,
      width: 52,
      decoration: BoxDecoration(
        color: isActive
            ? AppColors.primary
            : AppColors.secondary.withValues(alpha: 0.28),
        borderRadius: BorderRadius.circular(18),
      ),
      child: IconButton(
        icon: Icon(
          Icons.tune,
          color: isActive ? Colors.white : AppColors.primary,
        ),
        onPressed: onPressed,
      ),
    );
  }
}

class _SearchButton extends StatelessWidget {
  const _SearchButton({required this.onPressed});

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primary,
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
      ),
      onPressed: onPressed,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(Icons.search, color: Colors.white, size: 20),
          const SizedBox(width: 8),
          Text(
            'Search',
            style: AppTextStyles.button.copyWith(color: Colors.white),
          ),
        ],
      ),
    );
  }
}
