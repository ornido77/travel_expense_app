import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../app/di/injection.dart';
import '../../../auth/presentation/providers/auth_provider.dart';
import '../../domain/entities/expense.dart';
import '../../domain/usecases/get_expenses.dart';

part 'expenses_provider.g.dart';

@riverpod
class ExpensesNotifier extends _$ExpensesNotifier {
  @override
  Future<List<Expense>> build() async {
    final user = await ref.watch(authProvider.future);

    if (user == null) {
      return const [];
    }

    final result = await getIt<GetExpenses>()(
      userId: user.id,
    );

    return result.fold(
      (failure) => throw Exception(failure.message),
      (expenses) => expenses,
    );
  }

  Future<void> refresh() async {
    ref.invalidateSelf();
    await future;
  }
}
