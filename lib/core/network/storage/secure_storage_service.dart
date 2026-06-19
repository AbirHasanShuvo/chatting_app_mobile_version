import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorageServices {
  final _storage = const FlutterSecureStorage();
  Future<void> saveToken(String token) async {
    await _storage.write(key: 'token', value: token);
  }

  Future<String?> getToken() {
    return _storage.read(key: 'token');
  }

  Future<void> clearToken() async {
    await _storage.delete(key: 'token');
  }

  Future<void> clearAll() async {
    await _storage.deleteAll();
  }  
}