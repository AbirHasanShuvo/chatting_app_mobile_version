import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:snapchat_mobile/features/authentication/data/models/user_model.dart';

class MessageScreen extends ConsumerWidget {
  final UserModel user;
  const MessageScreen({super.key, required this.user});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(title: Text(user.name)),
      body: Padding(
        padding: const EdgeInsetsGeometry.all(15.0),
        child: Column(
          children: [
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ListView.builder(
                    itemCount: 5,
                    shrinkWrap: true,
                    primary: false,
                    itemBuilder: (_, index) {
                      return Align(
                        alignment: Alignment.centerRight,
                        child: Text(
                          'Hi, there',
                          style: GoogleFonts.lato(
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
            TextFormField(
              decoration: InputDecoration(
                suffixIcon: IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.send),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
