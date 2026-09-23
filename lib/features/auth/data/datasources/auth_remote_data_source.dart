import 'package:travel_expense_app/core/constants/api_constants.dart';
import 'package:travel_expense_app/core/error/exceptions.dart';
import 'package:travel_expense_app/core/network/api_client.dart';
import '../models/user_model.dart';

abstract interface class AuthRemoteDataSource {
  Future<UserModel> login({
    required String email,
    required String password,
  });
}

final class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final ApiClient _apiClient;

  AuthRemoteDataSourceImpl(this._apiClient);

  @override
  Future<UserModel> login({
    required String email,
    required String password,
  }) async {
    final response = await _apiClient.get(
      ApiConstants.endpoint(
        '/users',
        {
          'email': email,
          'password': password,
        },
      ),
    );

    if (response is! List || response.isEmpty) {
      throw const AuthenticationException('Invalid email or password.');
    }

    final json = Map<String, dynamic>.from(response.first as Map);
    return UserModel.fromJson(json);
  }
}
