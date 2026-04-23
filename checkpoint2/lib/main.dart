import 'package:checkpoint2/core/dependency_injection.dart';
import 'package:checkpoint2/presentation/mission_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'presentation/mission_list_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupDependencyInjection();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => MissionViewModel(getIt())),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Desafio 4 - Galaxy Monitor',
      theme: ThemeData(useMaterial3: true, colorSchemeSeed: Colors.teal),
      home: const MissionListScreen(),
    );
  }
}
