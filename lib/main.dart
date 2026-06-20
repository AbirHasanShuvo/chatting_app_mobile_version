import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:snapchat_mobile/core/network/dio_client.dart';
import 'package:snapchat_mobile/core/network/storage/secure_storage_service.dart';
import 'package:snapchat_mobile/router/go_router.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  final storage = SecureStorageServices();
  DioClient.init(storage);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        routerConfig: router,
       
      ),
    );
  }
}
