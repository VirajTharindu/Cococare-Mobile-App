class CFirebaseException implements Exception {
  final String code;

  CFirebaseException(this.code);

  String get message {
    switch (code) {
      case 'invalid-email':
        return 'The email address is badly formatted.';
      case 'user-disabled':
        return 'The user account has been disabled by an administrator.';
      case 'user-not-found':
        return 'There is no user record corresponding to this identifier. The user may have been deleted.';
      case 'wrong-password':
        return 'The password is invalid or the user does not have a password.';
      case 'email-already-in-use':
        return 'The email address is already in use by another account.';
      case 'weak-password':
        return 'The password must be 6 characters long or more.';
      case 'operation-not-allowed':
        return 'Email and password accounts are not enabled. Enable them in the Firebase console.';
      case 'too-many-requests':
        return 'Too many attempts to sign in as this user. Please try again later.';
      case 'invalid-verification-code':
        return 'The verification code entered is invalid.';
      case 'invalid-verification-id':
        return 'The verification ID entered is invalid.';
      case 'code-expired':
        return 'The verification code has expired. Please re-request a code.';
      case 'account-exists-with-different-credential':
        return 'An account already exists with the same email address but different sign-in credentials. Sign in using a provider associated with this email address.';

      case 'credential-already-in-use':
        return 'This credential is already associated with a different user account.';
      case 'invalid-credential':
        return 'The credential received is malformed or has expired.';
      case 'operation-not-supported-for-credential':
        return 'This operation is not supported for the given credential.';
      case 'user-token-expired':
        return 'The user\'s credential is no longer valid. The user must sign in again.';
      case 'user-mismatch':
        return 'The supplied credentials do not correspond to the previously signed in user.';
      case 'provider-already-linked':
        return 'This provider has already been linked to the account.';

      case 'quota-exceeded':
        return 'The project\'s quota for this operation has been exceeded.';
      case 'missing-android-pkg-name':
        return 'An Android package name must be provided.';
      case 'missing-continue-uri':
        return 'The continue URL must be provided.';
      case 'missing-ios-bundle-id':
        return 'An iOS bundle ID must be provided.';
      case 'invalid-continue-uri':
        return 'The continue URL is invalid.';
      case 'unauthorized-continue-uri':
        return 'The continue URL is not whitelisted. Please check your continue URL against your app\'s configuration.';
      case 'web-storage-unsupported':
        return 'The current environment does not support web storage. Please use a secure web storage API (e.g. localStorage).';
      case 'web-storage-unavailable':
        return 'The current browser does not support web storage. Please use a secure web storage API (e.g. localStorage).';
      case 'web-storage-invalid-character':
        return 'The current browser does not support web storage. Please use a secure web storage API (e.g. localStorage).';
      case 'web-storage-unknown-error':
        return 'The current browser does not support web storage. Please use a secure web storage API (e.g. localStorage).';
      case 'web-storage-full':
        return 'The current browser does not support web storage. Please use a secure web storage API (e.g. localStorage).';
      case 'web-storage-disabled':
        return 'The current browser does not support web storage. Please use a secure web storage API (e.g. localStorage).';

      case 'invalid-persistence-type':
        return 'The provided persistence type is invalid.';
      case 'invalid-creation-priority':
        return 'The provided creation priority is invalid.';

      case 'invalid-api-key':
        return 'The API key is invalid.';
      case 'invalid-creation-claims':
        return 'The provided creation claims are invalid.';
      case 'web-storage-max-size-exceeded':
        return 'The current browser does not support web storage. Please use a secure web storage API (e.g. localStorage).';
      case 'invalid-user-token':
        return 'The user\'s credential is no longer valid. The user must sign in again.';

      case 'invalid-phone-number':
        return 'The provided phone number is not valid.';

      default:
        return 'An unknown error occurred in Firebase.';
    }
  }
}
