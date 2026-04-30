import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';
import '../data/repositories/auth_repository.dart';
import '../data/repositories/user_repository.dart';
import '../data/services/auth_firebase_service.dart';
import '../data/services/user_firebase_service.dart';
import '../presentation/view_models/login_view_model.dart';
import '../presentation/view_models/registration_view_model.dart';
import '../presentation/view_models/home_view_model.dart';

final getIt = GetIt.instance;

void setupDependencyInjections() {
  //Firebase
  getIt.registerLazySingleton(() => FirebaseAuth.instance);
  getIt.registerLazySingleton(() => FirebaseFirestore.instance);

  // Services
  getIt.registerLazySingleton(() => AuthFirebaseService(getIt<FirebaseAuth>()));
  getIt.registerLazySingleton(() => UserFirebaseService(getIt<FirebaseFirestore>()));

  // Repositories
  getIt.registerLazySingleton(() => AuthRepository(getIt<AuthFirebaseService>()));
  getIt.registerLazySingleton(() => UserRepository(getIt<UserFirebaseService>()));

  // ViewModels
  getIt.registerFactory(() => LoginViewModel());
  getIt.registerFactory(() => RegistrationViewModel(getIt()));
  getIt.registerFactory(() => HomeViewModel());
}
