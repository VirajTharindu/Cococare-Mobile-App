class CFormatException implements Exception {
  final String message;

  const CFormatException(
      [this.message = 'An unexpected error occurred. Please try again later.']);

  //create a format exception from a specific error message
  factory CFormatException.fromMessage(String message) {
    return CFormatException(message);
  }

  //get corresponding error message
  String get formattedMessage => message;

  //create a format exception from a specific error message
  factory CFormatException.fromCode(String code) {
    switch (code) {
      case 'invalid-email-format':
        return const CFormatException('Please enter a valid email address.');

      case 'invalid-password-format':
        return const CFormatException('Please enter a valid password.');

      case 'invalid-username-format':
        return const CFormatException('Please enter a valid username.');

      case 'invalid-phone-number-format':
        return const CFormatException('Please enter a valid phone number.');

      case 'invalid-name-format':
        return const CFormatException('Please enter a valid name.');

      case 'invalid-address-format':
        return const CFormatException('Please enter a valid address.');

      case 'invalid-date-format':
        return const CFormatException('Please enter a valid date.');

      case 'invalid-time-format':
        return const CFormatException('Please enter a valid time.');

      case 'invalid-amount-format':
        return const CFormatException('Please enter a valid amount.');
      case 'invalide-numeric-format':
        return const CFormatException('Please enter a valid numeric value.');

      default:
        return const CFormatException(
            'An unexpected error occurred. Please try again later.');
    }
  }
}
