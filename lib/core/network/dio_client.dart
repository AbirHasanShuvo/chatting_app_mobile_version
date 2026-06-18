

import 'package:dio/dio.dart';
import 'package:snapchat_mobile/core/network/api_constants.dart';
import 'package:snapchat_mobile/core/network/interceptors/auth_interceptor.dart';
import 'package:snapchat_mobile/core/network/storage/secure_storage_service.dart';

class DioClient {
  static late Dio dio;

  static void init(SecureStorageServices storage) {
    dio = Dio(
      BaseOptions(
        baseUrl: AppConstants.baseUrl,
        connectTimeout: const Duration(seconds: 10),
        receiveTimeout: const Duration(seconds: 10),
      ),
    );

    dio.interceptors.add(AuthInterceptor(storage));
  }
}
