import 'package:flutter/material.dart';
import '../../../shared/styles/text_styles.dart';
import 'custom_text_field.dart';
import 'date_picker_field.dart';

class PersonalInfoSection extends StatelessWidget {
  final TextEditingController firstNameController;
  final TextEditingController lastNameController;
  final TextEditingController birthdayController;

  const PersonalInfoSection({
    super.key,
    required this.firstNameController,
    required this.lastNameController,
    required this.birthdayController,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // First name
        Text('First name', style: AppTextStyles.label),
        const SizedBox(height: 8),
        CustomTextField(
          controller: firstNameController,
          hint: 'Enter your first name',
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter your first name';
            }
            return null;
          },
        ),
        const SizedBox(height: 16),

        // Last name
        Text('Last name', style: AppTextStyles.label),
        const SizedBox(height: 8),
        CustomTextField(
          controller: lastNameController,
          hint: 'Enter your last name',
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter your last name';
            }
            return null;
          },
        ),
        const SizedBox(height: 16),

        // Date of birth
        Text('Date of birth', style: AppTextStyles.label),
        const SizedBox(height: 8),
        DatePickerField(
          controller: birthdayController,
          hint: 'Enter or select your date of birth',
          validator: _birthDateValidator,
        ),
      ],
    );
  }

  String? _birthDateValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your date of birth';
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
}
