import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entities/expense.dart';

part 'expense_model.freezed.dart';
part 'expense_model.g.dart';

@freezed
abstract class ExpenseModel with _$ExpenseModel {
  const factory ExpenseModel({
    required String id,
    required String userId,
    required double amount,
    required String date,
    required String category,
    required String note,
  }) = _ExpenseModel;

  const ExpenseModel._();

  factory ExpenseModel.fromJson(Map<String, dynamic> json) =>
      _$ExpenseModelFromJson(json);

  factory ExpenseModel.fromEntity(Expense expense) {
    return ExpenseModel(
      id: expense.id,
      userId: expense.userId,
      amount: expense.amount,
      date: expense.date.toIso8601String().split('T').first,
      category: expense.category.apiValue,
      note: expense.note,
    );
  }

  Expense toEntity() {
    final parsedCategory = ExpenseCategory.values.firstWhere(
      (value) => value.name == category,
      orElse: () => ExpenseCategory.other,
    );

    return Expense(
      id: id,
      userId: userId,
      amount: amount,
      date: DateTime.parse(date),
      category: parsedCategory,
      note: note,
    );
  }
}
