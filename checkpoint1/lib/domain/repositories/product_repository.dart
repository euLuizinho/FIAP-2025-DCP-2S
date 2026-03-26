import '../entities/product_entity.dart';

// Interface do repositório de produtos
abstract class ProductRepository {

  // Método para obter lista de produtos
  Future<List<ProductEntity>> getProducts();
  
}