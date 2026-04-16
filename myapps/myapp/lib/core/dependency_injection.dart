import 'dart:io';

import 'package:get_it/get_it.dart';
import 'package:myapp/core/http_client.dart';
import 'package:myapp/data/mission_remote_service.dart';
import 'package:myapp/data/mission_repository.dart';

final getIt = GetIt.instance;

Future<void> setupDependencyInjection() async {
  getIt.registerLazySingleton<CustomHttpClient>(CustomHttpClient.new);
  getIt.registerLazySingleton<MissionRemoteService>(
    () => MissionRemoteService(getIt()),
  );
  getIt.registerLazySingleton<MissionRepository>(
    () => MissionRepositoryImpl(getIt()),
  );
}
