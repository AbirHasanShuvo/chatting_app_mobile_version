import 'package:dio/dio.dart';
import 'package:snapchat_mobile/core/network/api_endpoints.dart';
import 'package:snapchat_mobile/core/network/dio_client.dart';
import 'package:snapchat_mobile/features/authentication/data/models/user_model.dart';

class HomeDatasource {
  Future<List<UserModel>> getUsers() async {
    try {
      final response = await DioClient.dio.get(ApiEndpoints.users);
      //print(response);
      final List data = response.data['users'];
      return data.map((e) => UserModel.fromJson(e)).toList();
    } on DioException catch (e) {
      final message = e.response?.data is Map<String, dynamic>
          ? e.response?.data['message']
          : "Failed to fetch users";

      throw Exception(message);
    }
  }
}
