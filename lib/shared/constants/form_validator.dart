class FormValidator {
  static String? required(String? value) {
    if (value == null || value.isEmpty) {
      return 'This field is required';
    }
    return null;
  }

  static String? url(String? value) {
    if (value == null || value.isEmpty) {
      return null; // Allow empty URL
    }

    final urlPattern = RegExp(
      r'^https?:\/\/([\w-]+\.)+[\w-]+(\/[\w- .\/?%&=]*)?$',
    );

    if (!urlPattern.hasMatch(value)) {
      return 'Please enter a valid URL (e.g., https://www.example.com)';
    }
    return null;
  }
}
