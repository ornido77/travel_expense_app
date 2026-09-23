import 'package:freezed_annotation/freezed_annotation.dart';

part 'expense.freezed.dart';

enum ExpenseCategory {
  flight,
  hotel,
  restaurant,
  taxi,
  other,
}

extension ExpenseCategoryX on ExpenseCategory {
  String get label {
    switch (this) {
      case ExpenseCategory.flight:
        return 'Flight';
      case ExpenseCategory.hotel:
        return 'Hotel';
      case ExpenseCategory.restaurant:
        return 'Restaurant';
      case ExpenseCategory.taxi:
        return 'Taxi';
      case ExpenseCategory.other:
        return 'Other';
    }
  }

  String get apiValue => name;
}

@freezed
abstract class Expense with _$Expense {
  const factory Expense({
    required String id,
    required String userId,
    required double amount,
    required DateTime date,
    required ExpenseCategory category,
    required String note,
  }) = _Expense;
}
