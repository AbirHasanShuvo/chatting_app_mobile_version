import 'package:snapchat_mobile/features/message/domain/entities/message_entity.dart';

class MessageModel extends MessageEntity {
  MessageModel({
    required super.id,
    required super.senderId,
    required super.receiverId,
    required super.message,
    required super.type,
    required super.createdAt,
    required super.isMe,
  });

  factory MessageModel.fromJson(Map<String, dynamic> json) {
    return MessageModel(
      id: json['id'],
      senderId: json['sender_id'],
      receiverId: json['receiver_id'],
      message: json['message'],
      type: json['type'],
      createdAt: DateTime.parse(json['created_at']),
      isMe: json['is_me'],
    );
  }
}