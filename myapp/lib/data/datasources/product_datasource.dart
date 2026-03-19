import 'package:myapp/core/custom_http_client.dart';
import 'package:myapp/data/models/product_model.dart';
import 'package:myapp/domain/entities/product_entity.dart';

class ProductDatasource {
  final CustomHttpClient httpClient;

  ProductDatasource(this.httpClient);

  Future<List<ProductEntity>> getProducts() async {
    final response = await httpClient.getProducts();

    final List<dynamic> dataList = response.data is List ? response.data : [];

    return dataList
        .map((e) => ProductModel.fromJson(e))
        .map((model) => model.toProductEntity())
        .toList();
  }

  //Método para cadastrar um produto
  Future<bool> createProduct(ProductEntity product) async{
    try{
      final model = ProductModel.fromProductEntity(product);
      await httpClient.createProduct(model.toJson());
      return true;
    }catch (e){
      return false;      
    }
  }

}
