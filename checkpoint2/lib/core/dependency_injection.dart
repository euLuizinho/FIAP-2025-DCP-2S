import 'package:get_it/get_it.dart';
import 'package:checkpoint2/core/http_client.dart';
import 'package:checkpoint2/data/mission_remote_service.dart';
import 'package:checkpoint2/data/mission_repository.dart';

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
