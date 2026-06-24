import 'package:dio/dio.dart';
import 'package:snapchat_mobile/core/network/dio_client.dart';
import 'package:snapchat_mobile/features/message/data/model/message_model.dart';

abstract class MessageRemoteDatasource {
  Future<List<MessageModel>> getMessages(int userId);
}

class MessageRemoteDatasourceImpl implements MessageRemoteDatasource {
  @override
  Future<List<MessageModel>> getMessages(int userId) async {
    try {
      final response = await DioClient.dio.get('messages/$userId');
      //inal response = await DioClient.dio.get('$$userId');


      final List data = response.data;
      return data.map((e) => MessageModel.fromJson(e)).toList();
    } on DioException catch (e) {
      final message = e.response?.data is Map<String, dynamic>
          ? e.response?.data['message']
          : "Failed to fetch messages";
      throw Exception(message);
    }
  }
}
