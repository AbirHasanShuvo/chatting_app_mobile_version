// import 'dart:convert';

// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:flutter_riverpod/legacy.dart';
// import 'package:snapchat_mobile/core/network/storage/secure_storage_service.dart';
// import 'package:snapchat_mobile/features/authentication/data/datasource/auth_remote_datasource.dart';
// import 'package:snapchat_mobile/features/authentication/data/models/user_model.dart';
// import 'package:snapchat_mobile/features/authentication/data/repositories/auth_repository_impl.dart';
// import 'package:snapchat_mobile/features/authentication/domain/repositories/auth_repository.dart';

// final secureStorageProvider = Provider<SecureStorageServices>((ref) {
//   return SecureStorageServices();
// });

// final authDatasourceProvider = Provider<AuthRemoteDatasource>((ref) {
//   return AuthRemoteDatasource();
// });

// final authrepositoryProvider = Provider<AuthRepository>(
//   (ref) => AuthRepositoryImpl(ref.read(authDatasourceProvider)),
// );

// //for smoothly fetching the user and use them 

// final userProvider = StateProvider<UserModel?>((ref) {
//   return null;
// });

// final fetchSavedUserProvider = FutureProvider<UserModel?>((ref) async {
//   final storage = ref.read(secureStorageProvider);
//   final userJsonString = await storage.getUser();
  
//   if (userJsonString != null) {
//     final user = UserModel.fromJson(jsonDecode(userJsonString));
//     ref.read(userProvider.notifier).state = user;
//     return user;
//   }
//   return null;
// });


import 'dart:convert';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:snapchat_mobile/core/network/storage/secure_storage_service.dart';
import 'package:snapchat_mobile/features/authentication/data/datasource/auth_remote_datasource.dart';
import 'package:snapchat_mobile/features/authentication/data/models/user_model.dart';
import 'package:snapchat_mobile/features/authentication/data/repositories/auth_repository_impl.dart';
import 'package:snapchat_mobile/features/authentication/domain/repositories/auth_repository.dart';

final secureStorageProvider = Provider<SecureStorageServices>((ref) {
  return SecureStorageServices();
});

final authDatasourceProvider = Provider<AuthRemoteDatasource>((ref) {
  return AuthRemoteDatasource();
});

final authRepositoryProvider = Provider<AuthRepository>((ref) {
  return AuthRepositoryImpl(ref.read(authDatasourceProvider));
});

final userProvider = StateProvider<UserModel?>((ref) => null);

final fetchSavedUserProvider = FutureProvider<UserModel?>((ref) async {
  final storage = ref.read(secureStorageProvider);
  final userJsonString = await storage.getUser();

  if (userJsonString != null) {
    final user = UserModel.fromJson(jsonDecode(userJsonString));
    ref.read(userProvider.notifier).state = user;
    return user;
  }

  return null;
});
