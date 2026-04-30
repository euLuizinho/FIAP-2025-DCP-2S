import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'core/dependency_injections.dart';
import 'presentation/login_screen.dart';
import 'presentation/view_models/home_view_model.dart';
import 'presentation/view_models/login_view_model.dart';
import 'presentation/view_models/registration_view_model.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  setupDependencyInjections();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => getIt<LoginViewModel>()),
        ChangeNotifierProvider(create: (_) => getIt<RegistrationViewModel>()),
        ChangeNotifierProvider(create: (_) => getIt<HomeViewModel>()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const LoginScreen(),
      ),
    );
  }
}
