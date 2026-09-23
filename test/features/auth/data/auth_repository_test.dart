import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:mocktail/mocktail.dart';

import 'package:travel_expense_app/core/error/exceptions.dart';
import 'package:travel_expense_app/core/error/failures.dart';
import 'package:travel_expense_app/features/auth/data/datasources/auth_remote_data_source.dart';
import 'package:travel_expense_app/features/auth/data/models/user_model.dart';
import 'package:travel_expense_app/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:travel_expense_app/features/auth/domain/entities/user.dart';

class MockAuthRemoteDataSource extends Mock implements AuthRemoteDataSource {}

void main() {
  late MockAuthRemoteDataSource dataSource;
  late AuthRepositoryImpl repository;

  const userModel = UserModel(
    id: '1',
    email: 'demo@example.com',
    name: 'Demo User',
    password: 'password123',
  );

  const expectedUser = User(
    id: '1',
    email: 'demo@example.com',
    name: 'Demo User',
  );

  setUp(() {
    dataSource = MockAuthRemoteDataSource();
    repository = AuthRepositoryImpl(dataSource);
  });

  group('login', () {
    test('returns User when login succeeds', () async {
      when(
        () => dataSource.login(
          email: 'demo@example.com',
          password: 'password123',
        ),
      ).thenAnswer((_) async => userModel);

      final result = await repository.login(
        email: 'demo@example.com',
        password: 'password123',
      );

      expect(result, const Right<Failure, User>(expectedUser));

      verify(
        () => dataSource.login(
          email: 'demo@example.com',
          password: 'password123',
        ),
      ).called(1);
    });

    test(
      'converts AuthenticationException into AuthenticationFailure',
      () async {
        when(
          () => dataSource.login(
            email: 'demo@example.com',
            password: 'wrong-password',
          ),
        ).thenThrow(
          const AuthenticationException('Invalid email or password.'),
        );

        final result = await repository.login(
          email: 'demo@example.com',
          password: 'wrong-password',
        );

        expect(
          result,
          const Left<Failure, User>(
            AuthenticationFailure('Invalid email or password.'),
          ),
        );
      },
    );

    test('converts NetworkException into NetworkFailure', () async {
      when(
        () => dataSource.login(
          email: 'demo@example.com',
          password: 'password123',
        ),
      ).thenThrow(const NetworkException('No internet connection.'));

      final result = await repository.login(
        email: 'demo@example.com',
        password: 'password123',
      );

      expect(
        result,
        const Left<Failure, User>(NetworkFailure('No internet connection.')),
      );
    });

    test('converts 500 ApiException into ServerFailure', () async {
      when(
        () => dataSource.login(
          email: 'demo@example.com',
          password: 'password123',
        ),
      ).thenThrow(
        const ApiException('Internal server error.', statusCode: 500),
      );

      final result = await repository.login(
        email: 'demo@example.com',
        password: 'password123',
      );

      expect(
        result,
        const Left<Failure, User>(ServerFailure('Internal server error.')),
      );
    });

    test('converts non-500 ApiException into ParsingFailure', () async {
      when(
        () => dataSource.login(
          email: 'demo@example.com',
          password: 'password123',
        ),
      ).thenThrow(const ApiException('Invalid response.', statusCode: 400));

      final result = await repository.login(
        email: 'demo@example.com',
        password: 'password123',
      );

      expect(
        result,
        const Left<Failure, User>(ParsingFailure('Invalid response.')),
      );
    });

    test('converts FormatException into ParsingFailure', () async {
      when(
        () => dataSource.login(
          email: 'demo@example.com',
          password: 'password123',
        ),
      ).thenThrow(const FormatException('Invalid user data.'));

      final result = await repository.login(
        email: 'demo@example.com',
        password: 'password123',
      );

      expect(
        result,
        const Left<Failure, User>(ParsingFailure('Invalid user data.')),
      );
    });

    test('converts unexpected exceptions into UnknownFailure', () async {
      when(
        () => dataSource.login(
          email: 'demo@example.com',
          password: 'password123',
        ),
      ).thenThrow(Exception('Unexpected error'));

      final result = await repository.login(
        email: 'demo@example.com',
        password: 'password123',
      );

      expect(
        result,
        const Left<Failure, User>(UnknownFailure('Something went wrong.')),
      );
    });
  });
}
