class CPlatformException implements Exception {
  final String code;

  CPlatformException(this.code);

  String get message {
    switch (code) {
      case 'invalid_login_credentials':
        return 'Invalid login credentials';

      case 'invalid_argument':
        return 'Invalid argument';

      case 'unknown_error':
        return 'Unknown error';

      case 'invalid_token':
        return 'Invalid token';

      case 'invalid_credentials':
        return 'Invalid credentials';

      case 'invalid_email':
        return 'Invalid email';

      case 'invalid_password':
        return 'Invalid password';

      case 'invalid_phone_number':
        return 'Invalid phone number';

      case 'invalid_username':
        return 'Invalid username';

      case 'invalid_name':
        return 'Invalid name';

      case 'invalid_gender':
        return 'Invalid gender';

      case 'invalid_birthdate':
        return 'Invalid birthdate';

      case 'invalid_address':
        return 'Invalid address';

      case 'invalid_city':
        return 'Invalid city';

      case 'invalid_state':
        return 'Invalid state';

      case 'invalid_country':
        return 'Invalid country';

      case 'invalid_zipcode':
        return 'Invalid zipcode';

      case 'invalid_country_code':
        return 'Invalid country code';

      case 'invalid_phone_number_format':
        return 'Invalid phone number format';

      case 'invalid_email_format':
        return 'Invalid email format';

      case 'invalid_password_format':
        return 'Invalid password format';

      case 'invalid_username_format':
        return 'Invalid username format';

      case 'invalid_name_format':
        return 'Invalid name format';

      case 'invalid_gender_format':
        return 'Invalid gender format';

      case 'invalid_birthdate_format':
        return 'Invalid birthdate format';

      case 'invalid_address_format':
        return 'Invalid address format';

      case 'invalid_city_format':
        return 'Invalid city format';

      case 'invalid_state_format':
        return 'Invalid state format';

      case 'invalid_country_format':
        return 'Invalid country format';

      case 'invalid_zipcode_format':
        return 'Invalid zipcode format';

      case 'invalid_country_code_format':
        return 'Invalid country code format';

      case 'invalid_phone_number_length':
        return 'Invalid phone number length';

      case 'invalid_email_length':
        return 'Invalid email length';

      case 'invalid_password_length':
        return 'Invalid password length';

      case 'invalid_username_length':
        return 'Invalid username length';

      case 'invalid_name_length':
        return 'Invalid name length';

      case 'invalid_gender_length':
        return 'Invalid gender length';

      case 'invalid_birthdate_length':
        return 'Invalid birthdate length';

      case 'invalid_address_length':
        return 'Invalid address length';

      case 'invalid_city_length':
        return 'Invalid city length';

      case 'invalid_state_length':
        return 'Invalid state length';

      case 'invalid_country_length':
        return 'Invalid country length';

      case 'invalid_zipcode_length':
        return 'Invalid zipcode length';

      case 'invalid_country_code_length':
        return 'Invalid country code length';

      case 'invalid_phone_number_pattern':
        return 'Invalid phone number pattern';

      case 'invalid_email_pattern':
        return 'Invalid email pattern';

      case 'invalid_password_pattern':
        return 'Invalid password pattern';

      case 'invalid_username_pattern':
        return 'Invalid username pattern';

      case 'invalid_name_pattern':
        return 'Invalid name pattern';

      case 'invalid_gender_pattern':

      default:
        return 'Unknown error';
    }
  }
}
