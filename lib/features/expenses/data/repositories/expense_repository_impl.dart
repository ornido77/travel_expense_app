import 'package:fpdart/fpdart.dart';

import '../../../../core/error/exceptions.dart';
import '../../../../core/error/failures.dart';
import '../../domain/entities/expense.dart';
import '../../domain/repositories/expense_repository.dart';
import '../datasources/expense_remote_data_source.dart';

final class ExpenseRepositoryImpl implements ExpenseRepository {
  final ExpenseRemoteDataSource _dataSource;

  ExpenseRepositoryImpl(this._dataSource);

  @override
  Future<Either<Failure, List<Expense>>> getExpenses({
    required String userId,
  }) async {
    try {
      final models = await _dataSource.getExpenses(userId: userId);
      return Right(models.map((model) => model.toEntity()).toList());
    } on NetworkException catch (e) {
      return Left(NetworkFailure(e.message));
    } on ApiException catch (e) {
      return Left(_mapApiFailure(e));
    } on FormatException catch (e) {
      return Left(ParsingFailure(e.message));
    } catch (_) {
      return const Left(UnknownFailure('Unable to load expenses.'));
    }
  }

  Failure _mapApiFailure(ApiException exception) {
    if ((exception.statusCode ?? 0) >= 500) {
      return ServerFailure(exception.message);
    }

    return ServerFailure(exception.message);
  }

  @override
  Future<Either<Failure, Expense>> addExpense(Expense expense) {
    // TODO: implement addExpense
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, Expense>> getExpense(String id) {
    // TODO: implement getExpense
    throw UnimplementedError();
  }
}
