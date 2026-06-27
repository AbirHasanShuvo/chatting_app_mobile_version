import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:snapchat_mobile/features/authentication/data/models/user_model.dart';
import 'package:snapchat_mobile/features/message/presesntation/providers/message_provider.dart';

class MessageScreen extends ConsumerStatefulWidget {
  final UserModel user;
  const MessageScreen({super.key, required this.user});

  @override
  ConsumerState<MessageScreen> createState() => _MessageScreenState();
}

class _MessageScreenState extends ConsumerState<MessageScreen> {
  // You can now easily declare controllers, focus nodes, or local state here
  late final TextEditingController _messageController;
  late final ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _messageController = TextEditingController();
    _scrollController = ScrollController();
    Future.microtask(
      () => ref
          .read(messageNotifierProvider.notifier)
          .loadMessage(widget.user.id),
    );
  }

  @override
  void dispose() {
    _messageController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  void _sendMessage(){
    final text = _messageController.text.trim();
    if(text.isEmpty) return;
    ref.read(messageNotifierProvider.notifier).sendMessage(widget.user.id, text);
    _messageController.clear();

    Future.delayed(const Duration(milliseconds: 100), () {
      if (_scrollController.hasClients) {
        _scrollController.animateTo(
          _scrollController.position.maxScrollExtent,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOut,
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    // ref is accessible directly anywhere inside this State class
    //final messagesAsync = ref.watch(messagesProvider(widget.user.id));
    final messagesAsync = ref.watch(messageNotifierProvider);

    return Scaffold(
      appBar: AppBar(title: Text(widget.user.name)), // Notice "widget.user"
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            Expanded(
              child: messagesAsync.when(
                loading: () => const Center(child: CircularProgressIndicator()),
                error: (e, _) => Center(child: Text(e.toString())),
                data: (messages) => ListView.builder(
                  controller: _scrollController ,
                  itemCount: messages.length,
                  itemBuilder: (_, index) {
                    final msg = messages[index];
                    return Align(
                      alignment: msg.isMe
                          ? Alignment.centerRight
                          : Alignment.centerLeft,
                      child: Container(
                        margin: const EdgeInsets.symmetric(vertical: 4),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 8,
                        ),
                        decoration: BoxDecoration(
                          color: msg.isMe
                              ? Colors.indigo
                              : Colors.grey.shade200,
                          borderRadius: BorderRadius.only(
                            topLeft: const Radius.circular(16),
                            topRight: const Radius.circular(16),
                            bottomLeft: Radius.circular(msg.isMe ? 16 : 4),
                            bottomRight: Radius.circular(msg.isMe ? 4 : 16),
                          ),
                        ),
                        child: Text(
                          msg.message,
                          style: GoogleFonts.lato(
                            fontSize: 15,
                            color: msg.isMe ? Colors.white : Colors.black87,
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
            const SizedBox(height: 8),
            TextFormField(
              controller: _messageController,
              onFieldSubmitted: (_) => _sendMessage(),
              decoration: InputDecoration(
                hintText: 'Type a message...',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(24),
                ),
                contentPadding: const EdgeInsets.symmetric(
                    horizontal: 16, vertical: 10),
                suffixIcon: IconButton(
                  icon: const Icon(Icons.send, color: Colors.indigo),
                  onPressed: _sendMessage,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
