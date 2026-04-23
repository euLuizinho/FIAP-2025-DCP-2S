import '../domain/mission_model.dart';
import 'mission_remote_service.dart';

/// **Repository**: contrato da camada de **Repository**
abstract class MissionRepository {
  Future<List<MissionModel>> getMissions();
  Future<MissionModel> getMissionById(int id);
  Future<bool> createMission(MissionModel mission);
  Future<bool> updateMission(MissionModel mission);
  Future<bool> deleteMission(int id);
}

/// Implementação do **Repository**: delega ao **Service** remoto.
class MissionRepositoryImpl implements MissionRepository {
  MissionRepositoryImpl(this._remoteService);

  final MissionRemoteService _remoteService;

  @override
  Future<List<MissionModel>> getMissions() => _remoteService.getMissions();

  @override
  Future<MissionModel> getMissionById(int id) =>
      _remoteService.getMissionById(id);

  @override
  Future<bool> createMission(MissionModel mission) =>
      _remoteService.createMission(mission);

  @override
  Future<bool> deleteMission(int id) => _remoteService.deleteMission(id);

  @override
  Future<bool> updateMission(MissionModel mission) =>
      _remoteService.updateMission(mission);
}
