import 'package:snapchat_mobile/features/message/data/model/datasources/message_remote_datasource.dart';
import 'package:snapchat_mobile/features/message/domain/entities/message_entity.dart';
import 'package:snapchat_mobile/features/message/domain/repositories/message_repository.dart';

class MessageRepositoryImpl implements MessageRepository {
  final MessageRemoteDatasource remoteDatasource;

  MessageRepositoryImpl({required this.remoteDatasource});

  @override
  Future<List<MessageEntity>> getMessages(int userId) async {
    return await remoteDatasource.getMessages(userId);
  }
}