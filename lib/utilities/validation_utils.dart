class ValidationUtils {
  static bool isValidateUsername(String userName) {
    return userName!.isEmpty;
  }

  static bool isValidatePassword(String password) {
    return password!.isEmpty;
  }

  static bool isValidateEmail(String email) {
    return !RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]").hasMatch(email!);
  }
}
