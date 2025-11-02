import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorageHelper {
  static const _storage = FlutterSecureStorage();

  // Save data securely
  static Future<void> write(String key, String value) async {
    await _storage.write(key: key, value: value);
  }

  // Read data
  static Future<String?> read(String key) async {
    return await _storage.read(key: key);
  }

  // Delete one key
  static Future<void> delete(String key) async {
    await _storage.delete(key: key);
  }

  // Clear all secure data
  static Future<void> clear() async {
    await _storage.deleteAll();
  }

}
