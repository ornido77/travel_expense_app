import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:mocktail/mocktail.dart';

import 'package:travel_expense_app/core/error/exceptions.dart';
import 'package:travel_expense_app/core/error/failures.dart';
import 'package:travel_expense_app/features/expenses/data/datasources/expense_remote_data_source.dart';
import 'package:travel_expense_app/features/expenses/data/models/expense_model.dart';
import 'package:travel_expense_app/features/expenses/data/repositories/expense_repository_impl.dart';
import 'package:travel_expense_app/features/expenses/domain/entities/expense.dart';

class _MockExpenseRemoteDataSource extends Mock
    implements ExpenseRemoteDataSource {}

void main() {
  late _MockExpenseRemoteDataSource dataSource;
  late ExpenseRepositoryImpl repository;

  setUp(() {
    dataSource = _MockExpenseRemoteDataSource();
    repository = ExpenseRepositoryImpl(dataSource);
  });

  test('repository maps remote models to domain entities', () async {
    final model = ExpenseModel(
      id: '1',
      userId: '1',
      amount: 100,
      date: '2026-09-23',
      category: 'taxi',
      note: 'Airport transfer',
    );

    when(
      () => dataSource.getExpenses(userId: '1'),
    ).thenAnswer((_) async => [model]);

    final result = await repository.getExpenses(userId: '1');

    expect(result.isRight(), isTrue);
    expect(result.getOrElse((_) => []).single.note, 'Airport transfer');
  });

  test('repository converts network exceptions into failures', () async {
    when(
      () => dataSource.getExpenses(userId: '1'),
    ).thenThrow(const NetworkException('No internet connection.'));

    final result = await repository.getExpenses(userId: '1');

    expect(
      result,
      const Left<Failure, List<Expense>>(
        NetworkFailure('No internet connection.'),
      ),
    );
  });
}
