import 'package:cloud_firestore/cloud_firestore.dart';

import '../../domain/models/user_model.dart';

class UserFirebaseService {
  FirebaseFirestore _firestore;

  UserFirebaseService(this._firestore);

  // Lógica de manipulação de dados do usuário no Firestore
  Future<void> saveUser(UserModel user) async {
    // Implementar salvamento no Firestore
  }

  Future<UserModel?> getUser(String id) async {
    // Implementar busca no Firestore
    return null;
  }
}
