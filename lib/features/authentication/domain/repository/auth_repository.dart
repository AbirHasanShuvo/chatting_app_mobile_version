import 'package:dio/dio.dart';
import 'package:snapchat_mobile/core/network/api_endpoints.dart';
import 'package:snapchat_mobile/core/network/dio_client.dart';

class AuthRepository {
  Future<Map<String, dynamic>> login({
    required String email,
    required String password,
  }) async {
    final response = await DioClient.dio.post(ApiEndpoints.login, data: {
      'email' : email,
      'password' : password
    });

    return response.data;
  }
}
