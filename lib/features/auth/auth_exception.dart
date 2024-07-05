class AuthException implements Exception {
  final String message;
  final int? code;

  AuthException(this.message, {this.code});

  @override
  String toString() {
    if (code != null) {
      return 'AuthException: $message (code: $code)';
    }
    return 'AuthException: $message';
  }
}
