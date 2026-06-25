import 'package:snapchat_mobile/features/message/data/model/message_model.dart';
import 'package:snapchat_mobile/features/message/domain/entities/message_entity.dart';
import 'package:snapchat_mobile/features/message/domain/repositories/message_repository.dart';

class SendMessageUsercases {
  final MessageRepository repository;
  SendMessageUsercases({required this.repository});

  Future<MessageEntity> call(int receiverId, String message) {
    return repository.sendMessage(receiverId, message);
  }
}
