import '../core/http_client.dart';
import '../domain/mission_model.dart';

class MissionRemoteService {
  MissionRemoteService(this._httpClient);

  final CustomHttpClient _httpClient;

  Future<List<MissionModel>> getMissions() async {
    final response = await _httpClient.get('/missions');
    final list = response.data as List<dynamic>;
    return list.map((e) => MissionModel.fromJson(e)).toList();
  }

  Future<MissionModel> getMissionById(int id) async {
    final response = await _httpClient.get('/missions/$id');
    return MissionModel.fromJson(response.data);
  }

  Future<bool> createMission(MissionModel mission) async {
    await _httpClient.post('/missions', data: mission.toJson());
    return true;
  }

  Future<bool> deleteMission(int id) async {
    await _httpClient.delete('/missions/$id');
    return true;
  }

  Future<bool> updateMission(MissionModel mission) async {
    await _httpClient.put('/missions/${mission.id}', data: mission.toJson());
    return true;
  }
}
