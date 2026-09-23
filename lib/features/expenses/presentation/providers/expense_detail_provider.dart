import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../app/di/injection.dart';
import '../../domain/entities/expense.dart';
import '../../domain/usecases/get_expense.dart';

part 'expense_detail_provider.g.dart';

@riverpod
Future<Expense> expenseDetail(Ref ref, String id) async {
  final result = await getIt<GetExpense>()(id);

  return result.fold(
    (failure) => throw Exception(failure.message),
    (expense) => expense,
  );
}
