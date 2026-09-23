import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:travel_expense_app/core/error/failures.dart';
import 'package:travel_expense_app/features/auth/domain/entities/user.dart';
import 'package:travel_expense_app/features/auth/domain/repositories/auth_repository.dart';
import 'package:travel_expense_app/features/auth/domain/usecases/login.dart';

class _FakeAuthRepository implements AuthRepository {
  Either<Failure, User> result;

  _FakeAuthRepository(this.result);

  @override
  Future<Either<Failure, User>> login({
    required String email,
    required String password,
  }) async {
    return result;
  }
}

void main() {
  test('login returns user on successful authentication', () async {
    final user = User(
      id: '1',
      email: 'demo@example.com',
      name: 'Demo User',
    );

    final useCase = Login(
      _FakeAuthRepository(Right(user)),
    );

    final result = await useCase(
      email: 'demo@example.com',
      password: 'password123',
    );

    expect(result, Right(user));
  });

  test('login returns failure when authentication fails', () async {
    const failure = AuthenticationFailure('Invalid credentials.');

    final useCase = Login(
      _FakeAuthRepository(const Left(failure)),
    );

    final result = await useCase(
      email: 'demo@example.com',
      password: 'wrong',
    );

    expect(result, const Left(failure));
  });
}
