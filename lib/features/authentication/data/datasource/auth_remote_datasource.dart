import 'package:dio/dio.dart';
import 'package:snapchat_mobile/core/network/api_endpoints.dart';
import 'package:snapchat_mobile/core/network/dio_client.dart';

class AuthRemoteDatasource {
  Future<Map<String, dynamic>> login({required String email, required String password})
  async{
    //print('Datasource hit properly');
    try{
      final response = await DioClient.dio.post(ApiEndpoints.login, data: {
      'email' : email,
      'password' : password
    });
    
    return response.data;
    }
    on DioException catch (e) {
  final data = e.response?.data;

  //String message = data['message'];

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