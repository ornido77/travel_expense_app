import 'dart:convert';

import 'package:http/http.dart' as http;

import '../error/exceptions.dart';

class ApiClient {
  final http.Client _client;

  ApiClient(this._client);

  Future<dynamic> get(Uri uri) async {
    try {
      final response = await _client.get(
        uri,
        headers: const {'Accept': 'application/json'},
      );

      return _decodeResponse(response);
    } on http.ClientException catch (e) {
      throw NetworkException(e.message);
    } on FormatException {
      throw const ApiException('The server returned invalid JSON.');
    }
  }

  Future<dynamic> post(
    Uri uri, {
    required Map<String, dynamic> body,
  }) async {
    try {
      final response = await _client.post(
        uri,
        headers: const {
          'Accept': 'application/json',
          'Content-Type': 'application/json',
        },
        body: jsonEncode(body),
      );

      return _decodeResponse(response);
    } on http.ClientException catch (e) {
      throw NetworkException(e.message);
    } on FormatException {
      throw const ApiException('The server returned invalid JSON.');
    }
  }

  dynamic _decodeResponse(http.Response response) {
    if (response.statusCode < 200 || response.statusCode >= 300) {
      throw ApiException(
        'Request failed with status ${response.statusCode}.',
        statusCode: response.statusCode,
      );
    }

    if (response.body.isEmpty) {
      return null;
    }

    return jsonDecode(response.body);
  }
}
