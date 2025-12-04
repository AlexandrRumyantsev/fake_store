import '../../../infrastructure/api.dart';
import '../../models/response/product_response.dart';
import '../rest/product.dart';

class ProductService {
  final _client = ProductsClient(API.dio);

  Future<ProductResponseModel> getProducts() {
    try {
      final response = _client.getProducts();
      return response;
    } catch (e) {
      throw Exception(e);
    }
  }
}
