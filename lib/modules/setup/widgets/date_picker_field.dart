import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import '../../../shared/styles/colors.dart';
import '../../../shared/styles/text_styles.dart';

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
  DateTime? _selectedDay;

  static const _months = [
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

  @override
  void initState() {
    super.initState();
    if (widget.controller.text.isNotEmpty) {
      _selectedDay = _parseDate(widget.controller.text);
    }
  }

  DateTime? _parseDate(String value) {
    try {
      final parts = value.split(' ');
      if (parts.length != 3) return null;
      final day = int.tryParse(parts[0]);
      final month = _months.indexOf(parts[1]) + 1;
      final year = int.tryParse(parts[2]);
      if (day == null || year == null || month == 0) return null;
      return DateTime(year, month, day);
    } catch (_) {
      return null;
    }
  }

  String _formatDate(DateTime date) =>
      '${date.day.toString().padLeft(2, '0')} ${_months[date.month - 1]} ${date.year}';

  void _showCalendar() {
    FocusScope.of(context).unfocus();
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      builder: (_) => _CalendarSheet(
        initialDay: _selectedDay ?? DateTime.now(),
        onSelect: (selected) {
          setState(() {
            _selectedDay = selected;
            widget.controller.text = _formatDate(selected);
          });
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _showCalendar,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(6),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.06),
              blurRadius: 62,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: TextFormField(
          controller: widget.controller,
          readOnly: true,
          validator: widget.validator,
          style: AppTextStyles.body.copyWith(color: AppColors.textPrimary),
          decoration: InputDecoration(
            hintText: widget.hint,
            hintStyle: AppTextStyles.body.copyWith(
              color: AppColors.textSecondary,
            ),
            suffixIcon: Icon(
              Icons.calendar_today_rounded,
              color: AppColors.textSecondary,
              size: 24,
            ),
            border: InputBorder.none,
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 12,
            ),
          ),
          onTap: _showCalendar,
        ),
      ),
    );
  }
}

class _CalendarSheet extends StatelessWidget {
  final DateTime initialDay;
  final ValueChanged<DateTime> onSelect;

  const _CalendarSheet({required this.initialDay, required this.onSelect});

  @override
  Widget build(BuildContext context) {
    DateTime focused = initialDay;

    return Container(
      padding: const EdgeInsets.all(20),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TableCalendar(
            firstDay: DateTime(1900),
            lastDay: DateTime.now(),
            focusedDay: focused,
            selectedDayPredicate: (day) => isSameDay(day, initialDay),
            onDaySelected: (selectedDay, _) {
              onSelect(selectedDay);
              Navigator.pop(context);
            },
            headerStyle: HeaderStyle(
              titleCentered: true,
              formatButtonVisible: false,
              titleTextStyle: AppTextStyles.label.copyWith(
                color: AppColors.textPrimary,
                fontSize: 16,
              ),
            ),
            calendarStyle: CalendarStyle(
              selectedDecoration: BoxDecoration(
                color: AppColors.primary,
                shape: BoxShape.circle,
              ),
              todayDecoration: BoxDecoration(
                color: AppColors.primary.withOpacity(0.2),
                shape: BoxShape.circle,
              ),
              outsideDaysVisible: false,
            ),
          ),
          const SizedBox(height: 16),
          Align(
            alignment: Alignment.centerRight,
            child: TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text(
                'Cancel',
                style: AppTextStyles.button.copyWith(
                  color: AppColors.textSecondary,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
