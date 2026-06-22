// import 'dart:convert';

// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:flutter_riverpod/legacy.dart';
// import 'package:snapchat_mobile/features/authentication/data/models/user_model.dart';
// import 'package:snapchat_mobile/features/authentication/domain/repositories/auth_repository.dart';
// import 'package:snapchat_mobile/features/authentication/providers/auth_provider.dart';

// final authControllerProvider =
//     StateNotifierProvider<AuthController, AsyncValue<void>>((ref) {
//       return AuthController(ref, ref.read(authrepositoryProvider));
//     });

// class AuthController extends StateNotifier<AsyncValue<void>> {
//   final AuthRepository repository;
//   final Ref ref;
//   AuthController(this.ref, this.repository) : super(const AsyncData(null));

//   Future<bool> login(String email, String password) async {
//     try {
//       //print('Login started');
//       state = AsyncLoading();
//       final res = await repository.login(email: email, password: password);
//       //print(res);
//       final token = res['token'];
//       await ref.read(secureStorageProvider).saveToken(token);
//       if (res['data'] != null) {
//         final user = UserModel.fromJson(res['data']);
//         final userJsonString = jsonEncode(user.toJson());
//         await ref.read(secureStorageProvider).saveUser(userJsonString);
//         ref.read(userProvider.notifier).state = user;
//       }

//       state = const AsyncData(null);
//       return true;
//     } catch (e) {
//       state = AsyncError(e, StackTrace.current);
//       return false;
//     }
//   }

//   Future<bool> register({
//     required String name,
//     required String date_of_birth,
//     required String email,
//     required String phone,
//     required String password,
//     required String profilePicturePath,
//   }) async {
//     try {
//       state = AsyncLoading();
//       final res = await repository.register(
//         name: name,
//         date_of_birth: date_of_birth,
//         email: email,
//         phone: phone,
//         password: password,
//         profilePicturePath: profilePicturePath,
//       );

//       final token = res['token'];
//       await ref.read(secureStorageProvider).saveToken(token);
//       if (res['data'] != null) {
//         final user = UserModel.fromJson(res['data']);
//         final userJsonString = jsonEncode(user.toJson());
//         await ref.read(secureStorageProvider).saveUser(userJsonString);
//         ref.read(userProvider.notifier).state = user;
//       }
//       state = const AsyncData(null);
//       return true;
//     } catch (e) {
//       state = AsyncError(e, StackTrace.current);
//       return false;
//     }
//   }

//   Future<void> logout() async {
//     await ref.read(secureStorageProvider).clearToken();
//     state = const AsyncData(null);
//   }
// }

import 'dart:convert';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:snapchat_mobile/features/authentication/data/models/user_model.dart';
import 'package:snapchat_mobile/features/authentication/providers/auth_provider.dart';
import 'package:snapchat_mobile/features/home/providers/home_provider.dart';

final authControllerProvider =
    StateNotifierProvider<AuthController, AsyncValue<void>>((ref) {
      return AuthController(ref);
    });

class AuthController extends StateNotifier<AsyncValue<void>> {
  final Ref ref;

  AuthController(this.ref) : super(const AsyncData(null));

  Future<bool> login(String email, String password) async {
    try {
      state = const AsyncLoading<void>();

      final repository = ref.read(authRepositoryProvider);
      final res = await repository.login(email: email, password: password);

      final token = res['token'];
      if (token == null) {
        throw Exception("Token missing from response");
      }

      final storage = ref.read(secureStorageProvider);
      await storage.saveToken(token);

      if (res['data'] != null) {
        final user = UserModel.fromJson(res['data']);

        await storage.saveUser(jsonEncode(user.toJson()));
        ref.read(userProvider.notifier).state = user;
      }

      state = const AsyncData<void>(null);
      ref.invalidate(alluserProvider);
      return true;
    } catch (e) {
      state = AsyncError(e, StackTrace.current);
      return false;
    }
  }

  Future<bool> register({
    required String name,
    required String date_of_birth,
    required String email,
    required String phone,
    required String password,
    required String profilePicturePath,
  }) async {
    try {
      state = const AsyncLoading<void>();

      final repository = ref.read(authRepositoryProvider);

      final res = await repository.register(
        name: name,
        date_of_birth: date_of_birth,
        email: email,
        phone: phone,
        password: password,
        profilePicturePath: profilePicturePath,
      );

      final token = res['token'];
      if (token == null) {
        throw Exception("Invalid Credential");
      }

      final storage = ref.read(secureStorageProvider);
      await storage.saveToken(token);

      if (res['data'] != null) {
        final user = UserModel.fromJson(res['data']);

        await storage.saveUser(jsonEncode(user.toJson()));
        ref.read(userProvider.notifier).state = user;
      }

      state = const AsyncData<void>(null);
      ref.invalidate(alluserProvider);
      return true;
    } catch (e) {
      state = AsyncError(e, StackTrace.current);
      return false;
    }
  }

  Future<void> logout() async {
    await ref.read(secureStorageProvider).clearToken();
    ref.read(userProvider.notifier).state = null;
    state = const AsyncData(null);
  }
}
