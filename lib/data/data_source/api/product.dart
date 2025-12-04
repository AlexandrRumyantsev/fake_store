import 'package:dio/dio.dart';

import '../../../infrastructure/api.dart';
import '../../models/response/product_response.dart';
import '../rest/product.dart';

class ProductService {
  final _client = ProductsClient(API.dio);

  Future<ProductResponseModel> getProducts() async {
    try {
      final response = await _client.getProducts();
      return response;
    } on DioException catch (e) {
      throw e.response?.data;
    }
  }
}
