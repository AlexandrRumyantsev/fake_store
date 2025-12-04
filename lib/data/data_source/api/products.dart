import '../../models/response/product_response.dart';
import '../../rest/product.dart';

class ProductsService {
  final ProductsClient productsClient;

  ProductsService({required this.productsClient});

  Future<ProductResponseModel> getProducts() async {
    return productsClient.getProducts();
  }
}
