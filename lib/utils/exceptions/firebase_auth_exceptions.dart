class CFirebaseAuthException implements Exception {
  //the error code that associated with the exception
  final String code;

  //constructor that takes an error code
  CFirebaseAuthException(this.code);

  //get corresponding error message based on the error code
  String get message {
    switch (code) {
      case 'ERROR_INVALID_EMAIL':
        return 'The email address is badly formatted.';
      case 'ERROR_WRONG_PASSWORD':
        return 'The password is invalid or the user does not have a password.';
      case 'ERROR_USER_NOT_FOUND':
        return 'There is no user record corresponding to this identifier. The user may have been deleted.';
      case 'ERROR_USER_DISABLED':
        return 'The user account has been disabled by an administrator.';
      case 'ERROR_TOO_MANY_REQUESTS':
        return 'We have blocked all requests from this device due to unusual activity. Try again later.';
      case 'ERROR_OPERATION_NOT_ALLOWED':
        return 'Email and password accounts are disabled for this Firebase project. Enable them in the Firebase console, under the Auth tab of the project.';

      case 'ERROR_WEAK_PASSWORD':
        return 'The password must be 6 characters long or more.';
      case 'ERROR_EMAIL_ALREADY_IN_USE':
        return 'The email address is already in use by another account.';

      case 'ERROR_INVALID_CREDENTIAL':
        return 'The credential received is malformed or has expired.';

      case 'ERROR_INVALID_VERIFICATION_CODE':
        return 'The verification code used to create the phone auth credential is invalid.';
      case 'ERROR_INVALID_VERIFICATION_ID':
        return 'The verification ID used to create the phone auth credential is invalid.';

      case 'ERROR_SESSION_EXPIRED':
        return 'The sms code has expired. Please re-send the verification code to try again.';
      case 'ERROR_TOO_MANY_ATTEMPTS_TRY_LATER':
        return 'We have blocked all requests from this device due to unusual activity. Try again later.';

      case 'ERROR_INVALID_PHONE_NUMBER':
        return 'The provided phone number is not valid.';
      case 'ERROR_NETWORK_REQUEST_FAILED':
        return 'A network error (such as timeout, interrupted connection or unreachable host) has occurred.';
      case 'ERROR_REQUIRES_RECENT_LOGIN':
        return 'This operation is sensitive and requires recent authentication. Log in again before retrying this request.';

      case 'ERROR_QUOTA_EXCEEDED':
        return 'The SMS quota for the project has been exceeded.';
      case 'ERROR_CAPTCHA_CHECK_FAILED':
        return 'The captcha check failed.';
      case 'ERROR_REDIRECT_CANCELED_BY_USER':
        return 'The redirect operation was canceled by the user.';

      case 'ERROR_REDIRECT_OPERATION_FAILED':
        return 'The redirect operation could not be completed. Please try again.';
      case 'ERROR_REDIRECT_REQUEST_NOT_COMPLETE':
        return 'The redirect request was not completed. Please try again.';
      case 'ERROR_REDIRECT_REQUEST_NOT_INITIATED':
        return 'The redirect request was not initiated. Please try again.';
      case 'ERROR_REDIRECT_SESSION_EXPIRED':
        return 'The redirect session has expired. Please try again.';
      case 'ERROR_REDIRECT_UNSUPPORTED_MEDIUM':
        return 'The redirect medium is not supported.';

      case 'ERROR_REDIRECT_UNKNOWN_ERROR':
        return 'An unknown error occurred.';
      case 'ERROR_REDIRECT_USER_CANCEL':
        return 'The redirect operation was canceled by the user.';
      case 'ERROR_REDIRECT_USER_DISCARDED':
        return 'The redirect operation was canceled by the user.';
      case 'ERROR_REDIRECT_USER_INITIATED':
        return 'The redirect operation was canceled by the user.';
      case 'ERROR_REDIRECT_USER_INTERACTION_REQUIRED':
        return 'The redirect operation was canceled by the user.';
      case 'ERROR_REDIRECT_WINDOW_CLOSED':
        return 'The redirect operation was canceled by the user.';
      case 'ERROR_REDIRECT_WINDOW_CLOSED_BY_USER':
        return 'The redirect operation was canceled by the user.';
      case 'ERROR_REDIRECT_WINDOW_OPEN_FAILED':
        return 'The redirect operation was canceled by the user.';
      case 'ERROR_REDIRECT_WINDOW_RESIZED':
        return 'The redirect operation was canceled by the user.';

      default:
        return 'An undefined Error happened.';
    }
  }
}
