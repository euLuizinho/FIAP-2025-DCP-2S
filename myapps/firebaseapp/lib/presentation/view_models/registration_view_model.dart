import 'package:firebaseapp/data/repositories/auth_repository.dart';
import 'package:flutter/material.dart';

class RegistrationViewModel extends ChangeNotifier {
  bool _isLoading = false;
  bool get isLoading => _isLoading;
  AuthRepository _authRepository;

  RegistrationViewModel(this._authRepository);

  Future<void> register(String name, String email, String password) async {
    _isLoading = true;
    notifyListeners();

    try{
      await _authRepository.signUp(email, password);
      debugPrint("Usuário cadastrado!");
    }catch(e){
      debugPrint("Falha ao cadastrar: $e");
      rethrow;
    }finally{
      _isLoading = false;
      notifyListeners();
    }
    
    
  }
}
