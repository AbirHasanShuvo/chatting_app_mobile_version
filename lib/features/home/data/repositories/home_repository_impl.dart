import 'package:snapchat_mobile/features/authentication/data/models/user_model.dart';
import 'package:snapchat_mobile/features/home/data/datasource/home_datasource.dart';
import 'package:snapchat_mobile/features/home/domain/repositories/home_repository.dart';

class HomeRepositoryImpl extends HomeRepository {
  final HomeDatasource datasource;
  HomeRepositoryImpl(this.datasource);

  @override
  Future<List<UserModel>> getUsers() {
    return datasource.getUsers();
  }

}