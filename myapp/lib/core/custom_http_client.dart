import 'package:dio/dio.dart';

class CustomHttpClient {
  final Dio dio;

  CustomHttpClient(): dio = Dio();

  Future<Response>  getProducts() async{
    return await dio.get("https://gdapp.com.br/api/fiap/products");
  }

  Future<void> createProduct(Map<String, dynamic> json) async {}

}