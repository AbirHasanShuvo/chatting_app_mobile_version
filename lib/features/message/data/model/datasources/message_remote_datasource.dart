import 'package:dio/dio.dart';
import 'package:snapchat_mobile/core/network/dio_client.dart';
import 'package:snapchat_mobile/features/message/data/model/message_model.dart';

abstract class MessageRemoteDatasource {
  Future<List<MessageModel>> getMessages(int userId);
  Future<MessageModel> sendMessage(int receiverId, String message);
}

class MessageRemoteDatasourceImpl implements MessageRemoteDatasource {
  @override
  Future<List<MessageModel>> getMessages(int userId) async {
    try {
      final response = await DioClient.dio.get('messages/$userId');

      final List data = response.data;
      return data.map((e) => MessageModel.fromJson(e)).toList();
    } on DioException catch (e) {
      final message = e.response?.data is Map<String, dynamic>
          ? e.response?.data['message']
          : "Failed to fetch messages";
      throw Exception(message);
    }
  }

  @override
  Future<MessageModel> sendMessage(int receiverId, String message) async {
    try {
      final response = await DioClient.dio.post(
        'message',
        data: {'receiver_id': receiverId, 'message': message, 'type': 'text'},
      );
      return MessageModel.fromJson(response.data);
    } on DioException catch (e) {
      final msg = e.response?.data is Map<String, dynamic>
          ? e.response?.data['message']
          : "Failed to send message";
      throw Exception(msg);
    }
  }
}
