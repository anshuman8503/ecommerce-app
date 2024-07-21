import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class AuthProvider with ChangeNotifier {
  final _storage = FlutterSecureStorage();
  bool _isAuthenticated = false;

  bool get isAuthenticated => _isAuthenticated;

  Future<void> login(String email, String password) async {
    // Logic to validate user credentials
    // For demonstration, assuming validation is successful
    await _storage.write(key: 'userEmail', value: email);
    await _storage.write(key: 'userPassword', value: password);
    _isAuthenticated = true;
    notifyListeners();
  }

  Future<void> logout() async {
    await _storage.deleteAll();
    _isAuthenticated = false;
    notifyListeners();
  }

  Future<void> tryAutoLogin() async {
    final email = await _storage.read(key: 'userEmail');
    final password = await _storage.read(key: 'userPassword');
    if (email != null && password != null) {
      _isAuthenticated = true;
      notifyListeners();
    }
  }

  Future<void> register(String name, String email, String phone, String password) async {
    // Logic to register user
    // For demonstration, assuming registration is successful
    await _storage.write(key: 'userName', value: name);
    await _storage.write(key: 'userEmail', value: email);
    await _storage.write(key: 'userPhone', value: phone);
    await _storage.write(key: 'userPassword', value: password);
    _isAuthenticated = true;
    notifyListeners();
  }
}
