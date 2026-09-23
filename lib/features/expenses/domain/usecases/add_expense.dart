import 'package:fpdart/fpdart.dart';

import '../../../../core/error/failures.dart';
import '../entities/expense.dart';
import '../repositories/expense_repository.dart';

final class AddExpense {
  final ExpenseRepository _repository;

  AddExpense(this._repository);

  Future<Either<Failure, Expense>> call(Expense expense) {
    if (expense.amount <= 0) {
      return Future.value(
        const Left(ValidationFailure('Amount must be greater than zero.')),
      );
    }

    if (expense.note.length > 500) {
      return Future.value(
        const Left(ValidationFailure('Note must be 500 characters or less.')),
      );
    }

    return _repository.addExpense(expense);
  }
}
