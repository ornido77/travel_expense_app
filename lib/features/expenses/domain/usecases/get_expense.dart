import 'package:fpdart/fpdart.dart';

import '../../../../core/error/failures.dart';
import '../entities/expense.dart';
import '../repositories/expense_repository.dart';

final class GetExpense {
  final ExpenseRepository _repository;

  GetExpense(this._repository);

  Future<Either<Failure, Expense>> call(String id) {
    return _repository.getExpense(id);
  }
}
