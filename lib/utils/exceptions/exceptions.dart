class CException implements Exception {
  // The error code associated with the exception
  final String code;

  // Constructor that takes an error code
  CException(this.code);

  // Getter method to return the error message based on the error code
  String get message {
    switch (code) {
      case 'invalid_input':
        return 'Invalid input provided.';
      case 'network_error':
        return 'Network error occurred.';
      case 'server_error':
        return 'Server error occurred.';
      case 'not_found':
        return 'Resource not found.';
      case 'unauthorized':
        return 'Unauthorized access.';
      case 'forbidden':
        return 'Access to the resource is forbidden.';
      case 'conflict':
        return 'Resource conflict occurred.';
      case 'internal_error':
        return 'An internal error occurred.';
      case 'not_implemented':
        return 'This feature is not implemented yet.';
      case 'service_unavailable':
        return 'The service is currently unavailable.';
      case 'timeout':
        return 'The request timed out.';
      case 'unknown':
        return 'An unknown error occurred.';
      case 'invalid_token':
        return 'Invalid token provided.';
      case 'invalid_credentials':
        return 'Invalid credentials provided.';
      case 'invalid_email':
        return 'Invalid email provided.';
      case 'invalid_password':
        return 'Invalid password provided.';
      case 'invalid_username':
        return 'Invalid username provided.';
      case 'invalid_phone_number':
        return 'Invalid phone number provided.';
      case 'invalid_address':
        return 'Invalid address provided.';
      case 'invalid_name':
        return 'Invalid name provided.';
      case 'invalid_date':
        return 'Invalid date provided.';
      case 'invalid_time':
        return 'Invalid time provided.';
      case 'invalid_datetime':
        return 'Invalid datetime provided.';
      case 'invalid_file':
        return 'Invalid file provided.';
      case 'invalid_image':
        return 'Invalid image provided.';

      default:
        return 'An unknown error occurred.';
    }
  }
}
