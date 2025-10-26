import 'package:flutter/material.dart';
import '../../../shared/styles/colors.dart';
import '../../../shared/styles/text_styles.dart';
import 'custom_text_field.dart';
import 'location_dropdown.dart';

class ContactInfoSection extends StatelessWidget {
  final TextEditingController phoneController;
  final Function(String) onProvinceChanged;
  final Function(String) onDistrictChanged;
  final bool hidePhoneField;

  const ContactInfoSection({
    super.key,
    required this.phoneController,
    required this.onProvinceChanged,
    required this.onDistrictChanged,
    this.hidePhoneField = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (!hidePhoneField) ...[
          // Phone number
          Text('Phone number', style: AppTextStyles.label),
          const SizedBox(height: 8),
          CustomTextField(
            controller: phoneController,
            hint: 'Enter your phone number',
            keyboardType: TextInputType.phone,
            validator: _phoneValidator,
            prefixIcon: Icon(Icons.phone, color: AppColors.textSecondary),
          ),
          const SizedBox(height: 16),
        ],

        // Location select
        ProvinceDistrictSelector(
          onProvinceChanged: onProvinceChanged,
          onDistrictChanged: onDistrictChanged,
        ),
      ],
    );
  }

  String? _phoneValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your phone number';
    }
    // Chấp nhận số bắt đầu bằng 0 hoặc +84
    final phoneRegex = RegExp(r'^(0|\+84)\d{9}$');
    if (!phoneRegex.hasMatch(value.replaceAll(RegExp(r'[\s-]'), ''))) {
      return 'Please enter a valid Vietnamese phone number';
    }
    return null;
  }
}
