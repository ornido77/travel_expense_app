import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:travel_expense_app/core/error/failures.dart';
import 'package:travel_expense_app/features/expenses/domain/entities/expense.dart';
import 'package:travel_expense_app/features/expenses/domain/repositories/expense_repository.dart';
import 'package:travel_expense_app/features/expenses/domain/usecases/add_expense.dart';

class _FakeExpenseRepository implements ExpenseRepository {
  bool called = false;

  @override
  Future<Either<Failure, Expense>> addExpense(Expense expense) async {
    called = true;
    return Right(expense);
  }

  @override
  Future<Either<Failure, Expense>> getExpense(String id) async {
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, List<Expense>>> getExpenses({
    required String userId,
  }) async {
    throw UnimplementedError();
  }
}

void main() {
  test('add expense rejects a non-positive amount', () async {
    final repository = _FakeExpenseRepository();
    final useCase = AddExpense(repository);

    final expense = Expense(
      id: '',
      userId: '1',
      amount: 0,
      date: DateTime(2026, 9, 23),
      category: ExpenseCategory.taxi,
      note: 'Airport transfer',
    );

    final result = await useCase(expense);

    expect(
      result,
      const Left(
        ValidationFailure('Amount must be greater than zero.'),
      ),
    );
    expect(repository.called, isFalse);
  });
}
