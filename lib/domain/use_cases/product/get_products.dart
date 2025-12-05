import '../../entities/product.dart';
import '../../repositories/product.dart';

class GetProductsUseCase {
  final ProductRepository _productRepository;

  GetProductsUseCase({required ProductRepository productRepository})
    : _productRepository = productRepository;

  Future<List<ProductEntity>> call() async {
    return _productRepository.getProducts();
  }
}
