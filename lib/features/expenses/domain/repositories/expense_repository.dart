import 'package:fpdart/fpdart.dart';

import '../../../../core/error/failures.dart';
import '../entities/expense.dart';

abstract interface class ExpenseRepository {
  Future<Either<Failure, List<Expense>>> getExpenses({
    required String userId,
  });

  Future<Either<Failure, Expense>> getExpense(String id);

  Future<Either<Failure, Expense>> addExpense(Expense expense);
}
