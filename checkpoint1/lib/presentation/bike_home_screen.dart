import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

class BikeHomeScreen extends StatefulWidget {
  const BikeHomeScreen({super.key});

  @override
  State<BikeHomeScreen> createState() => _BikeHomeScreenState();
}

class _BikeHomeScreenState extends State<BikeHomeScreen> {
  final Dio _dio = Dio();

  List<Map<String, dynamic>> _bikes = [];
  bool _isLoading = false;
  String? _errorMessage;

  @override
  void initState() {
    super.initState();
    _fetchBikes();
  }

  // Consome a API de bikes e atualiza o estado da tela
  Future<void> _fetchBikes() async {
    setState(() {
      _isLoading = true;
      _errorMessage = null;
    });

    try {
      // Faz a requisição GET para a API de bikes
      final response = await _dio.get('https://gdapp.com.br/api/fiap/bikes');
      final List data = response.data;
      setState(() {
        _bikes = data.cast<Map<String, dynamic>>();
      });
    } on DioException catch (e) {
      setState(() {
        _errorMessage = 'Erro ao carregar bikes: ${e.message}';
      });
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bikes'),
        backgroundColor: Colors.green,
        foregroundColor: Colors.white,
        actions: [
          IconButton(icon: const Icon(Icons.refresh), onPressed: _fetchBikes),
        ],
      ),
      // Exibe loading, erro ou a lista conforme o estado atual
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : _errorMessage != null
          //Exibe a mensagem de error caso a requisição falhe
          ? Center(child: Text(_errorMessage!))
          //Exibe a lista de bikes quando os dados estão disponíveis
          : ListView.builder(
              itemCount: _bikes.length,
              itemBuilder: (context, index) {
                final bike = _bikes[index];

                return ListTile(
                  leading: CircleAvatar(child: Text('${bike['id']}')),
                  title: Text(bike['name']),
                  subtitle: Text('Preço: R\$ ${bike['price']}'),
                  trailing: Text(bike['status']),
                );
              },
            ),
    );
  }
}
