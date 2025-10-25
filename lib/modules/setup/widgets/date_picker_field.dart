import 'package:flutter/material.dart';
import '../../../shared/styles/colors.dart';
import 'custom_text_field.dart';

class DatePickerField extends StatefulWidget {
  final TextEditingController controller;
  final String hint;
  final String? Function(String?)? validator;

  const DatePickerField({
    super.key,
    required this.controller,
    this.hint = 'Enter or select your date of birth',
    this.validator,
  });

  @override
  State<DatePickerField> createState() => _DatePickerFieldState();
}

class _DatePickerFieldState extends State<DatePickerField> {
  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: ColorScheme.light(
              primary: AppColors.primary,
              onPrimary: Colors.white,
              surface: Colors.white,
              onSurface: AppColors.textPrimary,
            ),
          ),
          child: child!,
        );
      },
    );
    if (picked != null) {
      setState(() {
        widget.controller.text =
            '${picked.day.toString().padLeft(2, '0')} ${_getMonthAbbrev(picked.month)} ${picked.year}';
      });
    }
  }

  String _getMonthAbbrev(int month) {
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
    return months[month - 1];
  }

  @override
  Widget build(BuildContext context) {
    return CustomTextField(
      controller: widget.controller,
      hint: widget.hint,
      readOnly: false,
      keyboardType: TextInputType.datetime,
      validator: widget.validator,
      suffix: IconButton(
        icon: Icon(
          Icons.calendar_today_rounded,
          color: AppColors.textSecondary,
          size: 24,
        ),
        onPressed: () => _selectDate(context),
      ),
    );
  }
}
