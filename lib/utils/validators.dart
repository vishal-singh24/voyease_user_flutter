class Validators {
  static bool isValidEmail(String email) {
    final RegExp regex = RegExp(
        r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$'); // Email regex pattern
    return regex.hasMatch(email);
  }

  static String? validateOtp(String value) {
    if (value.isEmpty) {
      return "Please enter Otp";
    } else if (value.length < 6) {
      return "Otp must be 6 character long";
    }
    return null;
  }

  static String? validatePassword(String value) {
    if (value.isEmpty) {
      return "Please enter Password";
    } else if (value.length < 8) {
      return "Password must be 8 character long";
    }
    return null;
  }
}
