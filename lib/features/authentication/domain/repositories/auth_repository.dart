abstract class AuthRepository {
  Future<Map<String, dynamic>> login({
    required String email,
    required String password,
  });

  Future<Map<String, dynamic>> register({
    required String name,
    required String date_of_birth,
    required String email,
    required String phone,
    required String password,
    required String profilePicturePath,
  });
}
