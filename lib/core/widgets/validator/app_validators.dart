abstract class AppValidators {
static String? validateAdminIdOrEmail(String? value) {
  if (value == null || value.trim().isEmpty) {
    return 'Required field';
  }

  final emailRegex = RegExp(
    r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
  );

  final idRegex = RegExp(r'^\d+$');

  if (!emailRegex.hasMatch(value) &&
      !idRegex.hasMatch(value)) {
    return 'Enter valid Admin ID or Email';
  }

  return null;
}
  static String? validatePassword(String? value) {
  if (value == null || value.isEmpty) {
    return 'Password is required';
  }

  if (value.length < 8) {
    return 'Minimum 8 characters';
  }

  if (!RegExp(r'[A-Z]').hasMatch(value)) {
    return 'Must contain uppercase letter';
  }

  if (!RegExp(r'[0-9]').hasMatch(value)) {
    return 'Must contain number';
  }

  return null;
}



  }
