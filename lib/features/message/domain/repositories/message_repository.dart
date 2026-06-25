import 'package:snapchat_mobile/features/message/data/model/message_model.dart';
import 'package:snapchat_mobile/features/message/domain/entities/message_entity.dart';

abstract class MessageRepository {
  Future<List<MessageEntity>> getMessages(int userId);
  Future<MessageModel> sendMessage(int receiverId, String message);
}
