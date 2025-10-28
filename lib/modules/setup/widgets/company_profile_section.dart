import 'package:find_job_mobile/modules/setup/widgets/custom_text_field.dart';
import 'package:find_job_mobile/modules/setup/widgets/date_picker_field.dart';
import 'package:find_job_mobile/shared/constants/form_validator.dart';
import 'package:find_job_mobile/shared/styles/colors.dart';
import 'package:find_job_mobile/shared/styles/text_styles.dart';
import 'package:flutter/material.dart';

class CompanyProfileSection extends StatelessWidget {
  final TextEditingController companyNameController;
  final TextEditingController establishedInController;
  final TextEditingController websiteController;

  const CompanyProfileSection({
    super.key,
    required this.companyNameController,
    required this.establishedInController,
    required this.websiteController,
  });

  String? _establishedValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your date of establishment';
    }
    try {
      final parts = value.split(' ');
      if (parts.length != 3) throw FormatException();

      final day = int.parse(parts[0]);
      if (day < 1 || day > 31) throw FormatException();

      const months = [
        'Jan',
        'Feb',
        'Mar',
        'Apr',
        'May',
        'Jun',
        'Jul',
        'Aug',
        'Sep',
        'Oct',
        'Nov',
        'Dec',
      ];
      if (!months.contains(parts[1])) throw FormatException();

      final year = int.parse(parts[2]);
      if (year < 1900 || year > DateTime.now().year) throw FormatException();

      return null;
    } catch (e) {
      return 'Please use format: DD MMM YYYY (e.g. 01 Jan 2000)';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Company Profile',
          style: AppTextStyles.heading2.copyWith(color: AppColors.textPrimary),
        ),
        const SizedBox(height: 12),

        // Company Name
        Text('Company Name', style: AppTextStyles.label),
        const SizedBox(height: 8),
        CustomTextField(
          controller: companyNameController,
          hint: 'Enter your company name',
          validator: FormValidator.required,
        ),
        const SizedBox(height: 16),

        // Established In
        Text('Established In', style: AppTextStyles.label),
        const SizedBox(height: 8),
        DatePickerField(
          controller: establishedInController,
          hint: 'Select establishment date',
          validator: _establishedValidator,
        ),
        const SizedBox(height: 16),

        // Website URL
        Text('Website', style: AppTextStyles.label),
        const SizedBox(height: 8),
        CustomTextField(
          controller: websiteController,
          hint: 'https://www.example.com',
          keyboardType: TextInputType.url,
          validator: FormValidator.url,
        ),
        const SizedBox(height: 16),
      ],
    );
  }
}
