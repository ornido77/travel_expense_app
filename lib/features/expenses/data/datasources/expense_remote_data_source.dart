import '../../../../core/constants/api_constants.dart';
import '../../../../core/network/api_client.dart';
import '../models/expense_model.dart';

abstract interface class ExpenseRemoteDataSource {
  Future<List<ExpenseModel>> getExpenses({required String userId});

  Future<ExpenseModel> getExpense(String id);

  Future<ExpenseModel> addExpense(ExpenseModel expense);
}

final class ExpenseRemoteDataSourceImpl implements ExpenseRemoteDataSource {
  final ApiClient _apiClient;

  ExpenseRemoteDataSourceImpl(this._apiClient);

  @override
  Future<List<ExpenseModel>> getExpenses({required String userId}) async {
    final response = await _apiClient.get(
      ApiConstants.endpoint('/expenses', {'userId': userId}),
    );

    if (response is! List) {
      throw const FormatException('Invalid expenses response.');
    }

    return response
        .map(
          (item) =>
              ExpenseModel.fromJson(Map<String, dynamic>.from(item as Map)),
        )
        .toList();
  }

  @override
  Future<ExpenseModel> getExpense(String id) async {
    final response = await _apiClient.get(
      ApiConstants.endpoint('/expenses/$id'),
    );

    if (response is! Map) {
      throw const FormatException('Invalid expense response.');
    }

    return ExpenseModel.fromJson(Map<String, dynamic>.from(response));
  }

  @override
  Future<ExpenseModel> addExpense(ExpenseModel expense) async {
    final response = await _apiClient.post(
      ApiConstants.endpoint('/expenses'),
      body: expense.toJson()..remove('id'),
    );

    if (response is! Map) {
      throw const FormatException('Invalid created expense response.');
    }

    return ExpenseModel.fromJson(Map<String, dynamic>.from(response));
  }
}
