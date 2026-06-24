import 'package:snapchat_mobile/features/message/domain/entities/message_entity.dart';
import 'package:snapchat_mobile/features/message/domain/repositories/message_repository.dart';

class GetMessagesUsecase {
  final MessageRepository repository;

  GetMessagesUsecase({required this.repository});

  Future<List<MessageEntity>> call(int userId) {
    return repository.getMessages(userId);
  }
}