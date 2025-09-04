
class TValidator {
  /// Empty Text Validation
 static String? validateEmptyText(String? fieldName, String? value) {
   if (value == null || value.isEmpty) {
     return '$fieldName is required.';
   }
   return null;
 }



  /// Validate Email Format
  static String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return "Email can't be empty";
    }
    final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    if (!emailRegex.hasMatch(value)) {
      return "Enter a valid email address";
    }
    return null;
  }

  /// Validate Password Strength
  static String? validatePassword(String? value, {int minLength = 6}) {
    if (value == null || value.isEmpty) {
      return "Password can't be empty";
    }
    if (value.length < minLength) {
      return "Password must be at least $minLength characters long";
    }
    return null;
  }

  /// Validate Required Field
  static String? validateRequired(String? value, {String fieldName = "Field"}) {
    if (value == null || value.isEmpty) {
      return "$fieldName is required";
    }
    return null;
  }

  /// Validate Username (No special characters)
  static String? validateUsername(String? value) {
    if (value == null || value.isEmpty) {
      return "Username can't be empty";
    }
    final usernameRegex = RegExp(r'^[a-zA-Z0-9_]+$');
    if (!usernameRegex.hasMatch(value)) {
      return "Username can only contain letters, numbers, and underscores.";
    }
    return null;
  }

  /// Validate Phone Number
  static String? validatePhoneNumber(String? value) {
    if (value == null || value.isEmpty) {
      return "Phone number is required.";
    }
    final phoneRegex = RegExp(r'^\+?[0-9]{7,15}$');
    if (!phoneRegex.hasMatch(value)) {
      return "Invalid phone number format (10 digits required).";
    }
    return null;
  }

  /// Validate Confirm Password (Must match original password)
  static String? validateConfirmPassword(String? value, String originalPassword) {
    if (value == null || value.isEmpty) {
      return "Confirm Password can't be empty";
    }
    if (value != originalPassword) {
      return "Passwords do not match";
    }
    return null;
  }
}
