import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:snapchat_mobile/features/authentication/presentation/controllers/auth_controller.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Logout'),
        actions: [IconButton(onPressed: () async{
          await ref.read(authControllerProvider.notifier).logout();
          if(context.mounted){
            context.go('login');
          }
        }, icon: Icon(Icons.logout))],
      ),
      body: Center(child: Text('This is a home screen is here')),
    );
  }
}
