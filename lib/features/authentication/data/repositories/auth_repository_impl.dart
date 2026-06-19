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

  @override
  Future<Map<String, dynamic>> register({
    required String name,
    required String date_of_birth,
    required String email,
    required String phone,
    required String password,
    required String profilePicturePath,
  }) {
    return remotedatasource.registration(
      name: name,
      date_of_birth: date_of_birth,
      email: email,
      phone: phone,
      password: password,
      profilePicturePath: profilePicturePath,
    );
  }
}
