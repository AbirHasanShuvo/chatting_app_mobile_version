import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:snapchat_mobile/features/message/data/model/datasources/message_remote_datasource.dart';
import 'package:snapchat_mobile/features/message/data/repositories/message_repository_impl.dart';
import 'package:snapchat_mobile/features/message/domain/entities/message_entity.dart';
import 'package:snapchat_mobile/features/message/domain/repositories/message_repository.dart';
import 'package:snapchat_mobile/features/message/domain/use_cases/get_message_usecases.dart';
import 'package:snapchat_mobile/features/message/domain/use_cases/send_message_usercases.dart';

final messageDatasourceProvider = Provider<MessageRemoteDatasource>(
  (ref) => MessageRemoteDatasourceImpl(),
);
final messageRepositoryProvider = Provider<MessageRepository>(
  (ref) => MessageRepositoryImpl(
    remoteDatasource: ref.read(messageDatasourceProvider),
  ),
);
final getMessageUsercase = Provider<GetMessagesUsecase>(
  (ref) => GetMessagesUsecase(repository: ref.read(messageRepositoryProvider)),
);
final messagesProvider = FutureProvider.family<List<MessageEntity>, int>((
  ref,
  userId,
) {
  return ref.read(getMessageUsercase).call(userId);
});


//so for the sending message provider and all in the below

final sendMessageUsecaseProvider = Provider<SendMessageUsercases>((ref){
  return SendMessageUsercases(repository: ref.read(messageRepositoryProvider));
});

//for managing state in very beautiful way there is needed a notifierprovider

// class MessageNotifier extends AsyncNotifier<List<MessageEntity>>{
//   late int _userId;

//   @override

// }




