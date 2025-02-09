class CValidator {
  //empty text validation
  static String? validateEmptyText(String? fieldName, String? value) {
    if (value == null || value.isEmpty) {
      return '$fieldName cannot be empty';
    }
    return null;
  }

  //email validation
  static String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Email cannot be empty';
    }

    //regular expression for email validation
    final emailRegex = RegExp(
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");

    if (!emailRegex.hasMatch(value)) {
      return 'Enter a valid email';
    }
    return null;
  }

  static String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Password cannot be empty';
    }

    //check for minimum password length
    if (value.length < 6) {
      return 'Password must be at least 6 characters';
    }

    //check for uppercase letters
    if (!value.contains(RegExp(r'[A-Z]'))) {
      return 'Password must contain at least one uppercase letter';
    }

    //check for numbers
    if (!value.contains(RegExp(r'[0-9]'))) {
      return 'Password must contain at least one number';
    }

    //check for special characters
    if (!value.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'))) {
      return 'Password must contain at least one special character';
    }

    return null;
  }

  static String? validatePhoneNumber(String? value) {
    if (value == null || value.isEmpty) {
      return 'Phone number cannot be empty';
    }

    //regular expression for phone number validation
    final phoneRegex = RegExp(r'^[0-9]{10}$');
    if (!phoneRegex.hasMatch(value)) {
      return 'Enter a valid phone number';
    }
    return null;
  }

  static String? validateNationalID(String? value) {
    if (value == null || value.isEmpty) {
      return 'National ID cannot be empty';
    }

    // Regular expressions for Sri Lankan national ID validation
    final nationalIDRegex1 = RegExp(r'^\d{9}[VvXx]$');

    final nationalIDRegex2 = RegExp(r'^\d{12}$');

    if (!nationalIDRegex1.hasMatch(value) &&
        !nationalIDRegex2.hasMatch(value)) {
      return 'Enter a valid Sri Lankan national ID';
    }

    return null;
  }

  //validate the address
  static String? validateAddress(String? value) {
    if (value == null || value.isEmpty) {
      return 'Address cannot be empty';
    }

    // Check minimum and maximum length
    if (value.length < 10 || value.length > 50) {
      return 'Address should be between 5 and 100 characters';
    }

    // Allowed characters: Alphanumeric, spaces, commas, periods, dashes, slashes, and special characters commonly found in addresses
    final allowedCharacters = RegExp(r'^[a-zA-Z0-9\s\-,./#&()]+$');
    if (!allowedCharacters.hasMatch(value)) {
      return 'Invalid characters in address';
    }

    // Additional custom validation criteria based on your requirements
    return null;
  }
}
