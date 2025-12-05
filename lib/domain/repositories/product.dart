import '../entities/product.dart';

abstract interface class ProductRepository {
  Future<List<ProductEntity>> getProducts();
}
