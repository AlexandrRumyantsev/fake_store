import '../../domain/entities/product.dart';
import '../../domain/repositories/product.dart';
import '../data_source/api/product.dart';
import '../mappers/product.dart';

class ProductRepositoryImpl implements ProductRepository {
  final ProductService productService;
  final ProductMapper productMapper;

  ProductRepositoryImpl({
    required this.productService,
    required this.productMapper,
  });

  @override
  Future<List<ProductEntity>> getProducts() async {
    final response = await productService.getProducts();
    final products = response.products.map(productMapper.toEntity).toList();
    return products;
  }
}
