class FormatHelper {
  static String formatPhoneNumber(String phone) {
    if (phone.isEmpty) return phone;

    // Remove non-digit characters but keep the leading zero
    phone = phone.replaceAll(RegExp(r'[^\d]'), '');

    return phone;
  }

  /// Format date from API "YYYY-MM-DD" or "YYYY-MM-DD HH:MM:SS.S" to display format "DD MMM YYYY"
  static String formatDateFromApi(String? dateStr) {
    if (dateStr == null || dateStr.isEmpty) return '';

    try {
      // Extract date part if it's a datetime string (e.g., "2025-11-02 00:00:00.0")
      String datePart = dateStr;
      if (dateStr.contains(' ')) {
        datePart = dateStr.split(' ')[0];
      }

      // Parse "YYYY-MM-DD"
      final parts = datePart.split('-');
      if (parts.length != 3) return dateStr;

      final year = parts[0];
      final monthNum = int.tryParse(parts[1]);
      final day = int.tryParse(parts[2]);

      if (monthNum == null || day == null) return dateStr;

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

      if (monthNum < 1 || monthNum > 12) return dateStr;

      final monthName = months[monthNum - 1];
      return '$day $monthName $year';
    } catch (e) {
      return dateStr;
    }
  }

  /// Convert date from display format "DD MMM YYYY" to API format "YYYY-MM-DD"
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
