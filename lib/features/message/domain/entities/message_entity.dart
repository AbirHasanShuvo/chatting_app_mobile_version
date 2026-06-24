class MessageEntity {
  final int id;
  final int senderId;
  final int receiverId;
  final String message;
  final String type;
  final DateTime createdAt;
  final bool isMe;

  MessageEntity({
    required this.id,
    required this.senderId,
    required this.receiverId,
    required this.message,
    required this.type,
    required this.createdAt,
    required this.isMe,
  });
}