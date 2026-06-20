import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:snapchat_mobile/features/authentication/data/models/user_model.dart';
import 'package:snapchat_mobile/features/home/data/datasource/home_datasource.dart';
import 'package:snapchat_mobile/features/home/data/repositories/home_repository_impl.dart';

final userDatasourceProvider = Provider<HomeDatasource>((ref) {
  return HomeDatasource();
});

final userRepositoryProvider = Provider<HomeRepositoryImpl>((ref){
  return HomeRepositoryImpl(ref.read(userDatasourceProvider));
});

//for the user provider which is directly needed
final alluserProvider = FutureProvider<List<UserModel>>((ref)async{
  final repository = ref.read(userRepositoryProvider);
  return repository.getUsers();
});
