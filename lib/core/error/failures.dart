import 'package:equatable/equatable.dart';

sealed class Failure extends Equatable {
  final String message;

  const Failure(this.message);
  @override
  List<Object?> get props => [message];
}

final class NetworkFailure extends Failure {
  const NetworkFailure(super.message);
}

final class ServerFailure extends Failure {
  const ServerFailure(super.message);
}

final class AuthenticationFailure extends Failure {
  const AuthenticationFailure(super.message);
}

final class ParsingFailure extends Failure {
  const ParsingFailure(super.message);
}

final class ValidationFailure extends Failure {
  const ValidationFailure(super.message);
}

final class UnknownFailure extends Failure {
  const UnknownFailure(super.message);
}
