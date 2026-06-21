// import 'package:dio/dio.dart';
// import 'package:snapchat_mobile/core/network/api_endpoints.dart';
// import 'package:snapchat_mobile/core/network/dio_client.dart';

// class AuthRemoteDatasource {
//   Future<Map<String, dynamic>> login({
//     required String email,
//     required String password,
//   }) async {
//     try {
//       final response = await DioClient.dio.post(
//         ApiEndpoints.login,
//         data: {'email': email, 'password': password},
//       );
//       return response.data;
//     } on DioException catch (e) {
//       final data = e.response?.data;


//       String message = "Something went wrong";

//       if (data is Map<String, dynamic>) {
//         message = data['message']?.toString() ?? message;
//       } else if (data is String) {
//         message = data;
//       }

//       throw Exception(message);
//     }
//   }

//   Future<Map<String, dynamic>> registration({
//     required String name,
//     required String date_of_birth,
//     required String email,
//     required String phone,
//     required String password,
//     required String profilePicturePath, 
//   }) async {
//     try {
//       final multipartFile = await MultipartFile.fromFile(
//         profilePicturePath,
//         filename: profilePicturePath.split('/').last, 
//       );

//       final formData = FormData.fromMap({
//         'name': name,
//         'date_of_birth': date_of_birth,
//         'email': email,
//         'phone': phone,
//         'password': password,
//         'profile_picture': multipartFile, 
//       });

//       final response = await DioClient.dio.post(
//         ApiEndpoints.register,
//         data: formData, 
//       );

//       return response.data;
//     } on DioException catch (e) {
//       final data = e.response?.data;
//       String message = "Something went wrong";

//       if (data is Map<String, dynamic>) {
//         message = data['message']?.toString() ?? message;
//       } else if (data is String) {
//         message = data;
//       }

//       throw Exception(message);
//     }
//   }
// }

import 'package:dio/dio.dart';
import 'package:snapchat_mobile/core/network/api_endpoints.dart';
import 'package:snapchat_mobile/core/network/dio_client.dart';

class AuthRemoteDatasource {
  Future<Map<String, dynamic>> login({
    required String email,
    required String password,
  }) async {
    try {
      final response = await DioClient.dio.post(
        ApiEndpoints.login,
        data: {'email': email, 'password': password},
      );

      return response.data;
    } on DioException catch (e) {
      final data = e.response?.data;

      String message = "Something went wrong";

      if (data is Map<String, dynamic>) {
        message = data['message']?.toString() ?? message;
      } else if (data is String) {
        message = data;
      }

      throw Exception(message);
    }
  }

  Future<Map<String, dynamic>> registration({
    required String name,
    required String date_of_birth,
    required String email,
    required String phone,
    required String password,
    required String profilePicturePath,
  }) async {
    try {
      final multipartFile = await MultipartFile.fromFile(
        profilePicturePath,
        filename: profilePicturePath.split('/').last,
      );

      final formData = FormData.fromMap({
        'name': name,
        'date_of_birth': date_of_birth,
        'email': email,
        'phone': phone,
        'password': password,
        'profile_picture': multipartFile,
      });

      final response = await DioClient.dio.post(
        ApiEndpoints.register,
        data: formData,
      );

      return response.data;
    } on DioException catch (e) {
      final data = e.response?.data;

      String message = "Something went wrong";

      if (data is Map<String, dynamic>) {
        message = data['message']?.toString() ?? message;
      } else if (data is String) {
        message = data;
      }

      throw Exception(message);
    }
  }
}
