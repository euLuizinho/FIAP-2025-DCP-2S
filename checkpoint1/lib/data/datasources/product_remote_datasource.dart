import '../../core/http_client.dart';
import 'package:checkpoint1/data/models/product_model.dart';
import 'package:checkpoint1/domain/entities/product_entity.dart';

class ProductRemoteDatasource {
  final CustomHttpClient httpClient;

  ProductRemoteDatasource(this.httpClient);

  Future<List<ProductEntity>> getProducts() async {
    final response = await httpClient.getProducts();

    final List<dynamic> dataList = response.data is List ? response.data : [];

    return dataList
        .map((e) => ProductModel.fromJson(e))
        .map((model) => model.toEntity())
        .toList();
  }
}
