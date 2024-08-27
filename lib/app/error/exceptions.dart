class ServerException implements Exception {
  String cause;
  ServerException(this.cause);

  @override
  String toString() {
    return cause;
  }
}

class CacheException implements Exception {}

class DataParsingException implements Exception {
  String cause;
  DataParsingException(this.cause);

  @override
  String toString() {
    return cause;
  }
}

class ErrorDataException implements Exception {
  String cause;
  ErrorDataException(this.cause);

  @override
  String toString() {
    return cause;
  }
}

class AuthException implements Exception {
  String cause;
  AuthException(this.cause,);

  @override
  String toString() {
    return cause;
  }
}
