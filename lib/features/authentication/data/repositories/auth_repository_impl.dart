import 'package:snapchat_mobile/features/authentication/data/datasource/auth_remote_datasource.dart';
import 'package:snapchat_mobile/features/authentication/domain/repositories/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDatasource remotedatasource;
  AuthRepositoryImpl(this.remotedatasource);

  @override
  Future<Map<String, dynamic>> login({
    required String email,
    required String password,
  }) {
    return remotedatasource.login(email: email, password: password);
  }
}
