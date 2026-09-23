import 'package:fpdart/fpdart.dart';

import '../../../../core/error/failures.dart';
import '../entities/expense.dart';
import '../repositories/expense_repository.dart';

final class GetExpenses {
  final ExpenseRepository _repository;

  GetExpenses(this._repository);

  Future<Either<Failure, List<Expense>>> call({
    required String userId,
  }) {
    return _repository.getExpenses(userId: userId);
  }
}
