import 'package:flutter/material.dart';

class LoginViewModel extends ChangeNotifier {
  bool _isLoading = false;
  bool get isLoading => _isLoading;

  Future<void> login(String email, String password) async {
    _isLoading = true;
    notifyListeners();

    // Simulação de login
    await Future.delayed(const Duration(seconds: 2));
    print('Login realizado com $email');

    _isLoading = false;
    notifyListeners();
  }
}
