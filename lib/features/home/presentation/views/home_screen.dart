import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:snapchat_mobile/features/authentication/presentation/controllers/auth_controller.dart';
import 'package:snapchat_mobile/features/authentication/providers/auth_provider.dart';
import 'package:snapchat_mobile/features/home/providers/home_provider.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(fetchSavedUserProvider);
    final alluser = ref.watch(alluserProvider);
    return Scaffold(
      appBar: AppBar(
        title: Text('chats'),
        centerTitle: false,
        actions: [
          IconButton(
            onPressed: () async {
              await ref.read(authControllerProvider.notifier).logout();
              if (context.mounted) {
                context.go('login');
              }
            },
            icon: Icon(Icons.logout),
          ),
        ],
      ),
      body: alluser.when(
        data: (data) {
          return ListView.builder(
            itemCount: data.length,
            itemBuilder: (_, item) {
              final user = data[item];
              return ListTile(
                onTap: () => context.push('message/${user.id}'),
                title: Text(user.name),
                subtitle: Text(user.email),
                leading: CircleAvatar(
                  backgroundImage: NetworkImage(
                    'http://127.0.0.1:8000${user.profilePicture}',
                  ),
                ),
              );
            },
          );
        },
        error: (error, stack) => Center(child: Text(error.toString())),
        loading: () => Center(child: CircularProgressIndicator()),
      ),
    );
  }
}
