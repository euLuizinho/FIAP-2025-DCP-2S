import 'package:myapp/core/http_client.dart';
import 'package:myapp/domain/mission_model.dart';

class MissionRemoteService {
  final CustomHttpClient _clientHttp;

  MissionRemoteService(this._clientHttp);

  Future<List<MissionModel>> getMissions() async {
    final response = await _clientHttp.get('/missions');
    final list = response.data as List<dynamic>;
    return list.map((e)=>MissionModel.fromJson(e)).toList();
  }
}
