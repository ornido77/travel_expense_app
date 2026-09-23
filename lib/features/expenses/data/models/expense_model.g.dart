// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'expense_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ExpenseModel _$ExpenseModelFromJson(Map<String, dynamic> json) =>
    _ExpenseModel(
      id: json['id'] as String,
      userId: json['userId'] as String,
      amount: (json['amount'] as num).toDouble(),
      date: json['date'] as String,
      category: json['category'] as String,
      note: json['note'] as String,
    );

Map<String, dynamic> _$ExpenseModelToJson(_ExpenseModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'amount': instance.amount,
      'date': instance.date,
      'category': instance.category,
      'note': instance.note,
    };
