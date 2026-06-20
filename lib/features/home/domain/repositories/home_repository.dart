


import 'package:snapchat_mobile/features/authentication/data/models/user_model.dart';

abstract class HomeRepository {
  Future<List<UserModel>> getUsers();
}