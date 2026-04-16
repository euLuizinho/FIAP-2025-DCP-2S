import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:myapp/data/mission_repository.dart';

import '../domain/mission_model.dart';

/// ViewModel responsável por gerenciar o estado da lista de missões.
class MissionViewModel extends ChangeNotifier {
  final MissionRepository _missionRepository;

  MissionViewModel(this._missionRepository);

  // Lista interna de missões
  List<MissionModel> _missions = [];

  // Indicador de carregamento
  bool _isLoading = false;

  // Mensagem de erro, se houver
  String? _errorMessage;

  /// Retorna a lista atual de missões.
  List<MissionModel> get missions => _missions;

  /// Retorna [true] se os dados estiverem sendo carregados.
  bool get isLoading => _isLoading;

  /// Retorna a mensagem de erro atual ou [null] se não houver erro.
  String? get errorMessage => _errorMessage;

  /// Carrega as missões da fonte de dados e atualiza o estado.
  Future<void> loadMissions() async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      _missions = await _missionRepository.getMissions();
    } on DioException catch (e) {
      _errorMessage = 'Erro ao carregar as missões bbzinha - ${e.message}';
    } catch (e) {
      _errorMessage = 'Erro - Tente novamente mais tarde!';
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> createMission(MissionModel mission) async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();
    try {
      await _missionRepository.createMission(mission);
    } on DioException catch (e) {
      _errorMessage = 'Erro ao cadastrar missão: ${e.message}';
    } catch (e) {
      _errorMessage = 'Erro genérico: $e';
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
