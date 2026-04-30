import 'package:firebase_auth/firebase_auth.dart';

class AuthFirebaseService {
  FirebaseAuth _auth;

  AuthFirebaseService(this._auth);

  // Lógica de autenticação com Firebase
  Future<void> signIn(String email, String password) async {
    // Implementar login
    await _auth.signInWithEmailAndPassword(
      email: email,
      password: password
      );
  }

  Future<void> signUp(String email, String password) async {
    // Implementar cadastro
    await _auth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

  Future<void> signOut() async {
    // Implementar logout
    await _auth.signOut();
  }
}
