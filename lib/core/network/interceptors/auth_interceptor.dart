import 'package:dio/dio.dart';
import 'package:snapchat_mobile/core/network/dio_client.dart';
import 'package:snapchat_mobile/core/network/storage/secure_storage_service.dart';

class AuthInterceptor extends Interceptor {
  final SecureStorageServices storage;

  AuthInterceptor(this.storage);

  @override
  void onRequest(
      RequestOptions options,
      RequestInterceptorHandler handler,
  ) async {
    final token = await storage.getToken();

    if (token != null) {
      options.headers['Authorization'] = 'Bearer $token';
    }

    options.headers['Accept'] = 'application/json';

    return handler.next(options);
  }
}