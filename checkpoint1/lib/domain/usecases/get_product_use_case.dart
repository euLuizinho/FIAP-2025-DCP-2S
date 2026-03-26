import '../entities/product_entity.dart';
import '../repositories/product_repository.dart';

// Caso de uso para buscar produtos
class GetProductUseCase {
  final ProductRepository productRepository;

  // Recebe o repositório via construtor
  GetProductUseCase(this.productRepository);

  // Executa a busca de produtos
  Future<List<ProductEntity>> execute() async {
    return await productRepository.getProducts();
  }
}