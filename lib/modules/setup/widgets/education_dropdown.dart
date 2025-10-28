import 'package:flutter/material.dart';
import '../../../shared/styles/colors.dart';
import '../../../shared/styles/text_styles.dart';

class EducationDropdown extends StatefulWidget {
  final String? initialValue;
  final ValueChanged<String>? onChanged;

  const EducationDropdown({super.key, this.initialValue, this.onChanged});

  @override
  State<EducationDropdown> createState() => _EducationDropdownState();
}

class _EducationDropdownState extends State<EducationDropdown> {
  late String? _selectedValue;
  bool _isFocused = false;

  final List<Map<String, String>> _educationLevels = [
    {'display': 'Graduation', 'value': 'GRADUATION'},
    {'display': "Bachelor's Degree", 'value': 'BACHELOR_DEGREE'},
    {'display': "Master's Degree", 'value': 'MASTER_DEGREE'},
    {'display': 'High School', 'value': 'HIGH_SCHOOL'},
    {'display': 'Intermediate', 'value': 'INTERMEDIATE'},
  ];

  @override
  void initState() {
    super.initState();
    _selectedValue = widget.initialValue;
  }

  @override
  Widget build(BuildContext context) {
    return FocusScope(
      onFocusChange: (hasFocus) {
        setState(() => _isFocused = hasFocus);
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Education', style: AppTextStyles.label),
          const SizedBox(height: 8),
          GestureDetector(
            onTap: () => setState(() => _isFocused = true),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(6),
                border: Border.all(
                  color: _isFocused
                      ? AppColors.primary
                      : AppColors.textTertiary.withOpacity(0.3),
                  width: 1,
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.06),
                    blurRadius: 62,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: DropdownButtonHideUnderline(
                child: DropdownButton<String>(
                  value: _selectedValue,
                  hint: Text(
                    'Select your education',
                    style: AppTextStyles.body.copyWith(
                      color: AppColors.textSecondary,
                    ),
                  ),
                  isExpanded: true,
                  icon: const Icon(Icons.arrow_drop_down),
                  items: _educationLevels.map((level) {
                    return DropdownMenuItem(
                      value: level['value'],
                      child: Text(
                        level['display']!,
                        style: AppTextStyles.body.copyWith(
                          color: AppColors.textPrimary,
                        ),
                      ),
                    );
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      _selectedValue = value;
                      _isFocused = false;
                    });
                    widget.onChanged?.call(value!);
                  },
                  onTap: () => setState(() => _isFocused = true),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
