import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';

import '../../models/response/product.dart';

part 'product.g.dart';

/// Клиент для работы с продуктами
@RestApi()
abstract class ProductsClient {
  factory ProductsClient(Dio dio) = _ProductsClient;

  @GET('/products')
  Future<List<ProductModel>> getProducts();
}
