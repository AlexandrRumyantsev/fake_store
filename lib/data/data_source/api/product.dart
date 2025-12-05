import 'package:dio/dio.dart';

import '../../../infrastructure/api.dart';
import '../../models/response/product.dart';
import '../rest/product.dart';

class ProductService {
  final _client = ProductsClient(API.dio);

  Future<List<ProductModel>> getProducts() async {
    try {
      final response = await _client.getProducts();
      return response;
    } on DioException catch (e) {
      throw e.response?.data;
    }
  }
}
