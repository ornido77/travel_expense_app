import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../app/di/injection.dart';
import '../../domain/entities/expense.dart';
import '../../domain/usecases/add_expense.dart';
import 'expenses_provider.dart';

part 'add_expense_provider.g.dart';

@riverpod
class AddExpenseNotifier extends _$AddExpenseNotifier {
  @override
  FutureOr<void> build() {}

  Future<bool> submit(Expense expense) async {
    state = const AsyncLoading();

    final result = await getIt<AddExpense>()(expense);

    return result.fold(
      (failure) {
        state = AsyncError(
          failure.message,
          StackTrace.current,
        );
        return false;
      },
      (_) {
        state = const AsyncData(null);

        ref.invalidate(expensesProvider);

        return true;
      },
    );
  }
}