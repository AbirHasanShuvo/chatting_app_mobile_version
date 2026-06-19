import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:snapchat_mobile/core/network/storage/secure_storage_service.dart';
import 'package:snapchat_mobile/features/authentication/data/datasource/auth_remote_datasource.dart';
import 'package:snapchat_mobile/features/authentication/data/repositories/auth_repository_impl.dart';
import 'package:snapchat_mobile/features/authentication/domain/repositories/auth_repository.dart';

final secureStorageProvider = Provider<SecureStorageServices>((ref) {
  return SecureStorageServices();
});

final authDatasourceProvider = Provider<AuthRemoteDatasource>((ref) {
  return AuthRemoteDatasource();
});

final authrepositoryProvider = Provider<AuthRepository>(
  (ref) => AuthRepositoryImpl(ref.read(authDatasourceProvider)),
);
