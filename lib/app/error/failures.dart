abstract class Failure {
  String? cause;
  Failure([this.cause]);

}

// General failures
class ServerFailure extends Failure {
  ServerFailure(super.cause);
}

class AmbiguousFailure extends Failure {
  AmbiguousFailure(super.cause);
}

class ConnectionFailure extends Failure {
  ConnectionFailure(super.cause);
}

class DataParsingFailure extends Failure {
  DataParsingFailure(super.cause);
}

class AuthFailure extends Failure {
  AuthFailure(super.cause);
}
