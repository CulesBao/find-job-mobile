class FormatHelper {
  static String formatPhoneNumber(String phone) {
    if (phone.isEmpty) return phone;

    phone = phone.replaceAll(RegExp(r'[^\d]'), '');

    if (phone.startsWith('0')) {
      phone = phone.substring(1);
    }

    return '+84$phone';
  }

  static String convertDateFormat(String dateStr) {
    try {
      final parts = dateStr.split(' ');
      if (parts.length != 3) return dateStr;

      final day = parts[0].padLeft(2, '0');
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

      final monthIndex = months.indexOf(parts[1]) + 1;
      if (monthIndex == 0) return dateStr;

      final month = monthIndex.toString().padLeft(2, '0');
      final year = parts[2];

      final dayInt = int.tryParse(day);
      final yearInt = int.tryParse(year);
      if (dayInt == null ||
          yearInt == null ||
          dayInt < 1 ||
          dayInt > 31 ||
          yearInt < 1900) {
        return dateStr;
      }

      final date = DateTime.tryParse('$year-$month-$day');
      if (date == null) return dateStr;

      return '$year-$month-$day';
    } catch (e) {
      return dateStr;
    }
  }
}
