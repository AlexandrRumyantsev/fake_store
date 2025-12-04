import 'package:dio/dio.dart';

class API {
  static late final Dio dio;
  
  static const String baseUrl = 'https://fakestoreapi.com';

  /// Базовый набор хэдеров для запросов
  static const Map<String, dynamic> baseHeaders = {
    'Accept': 'application/json, application/problem+json',
    'Content-Type': 'application/json',
  };

  static final BaseOptions _options = BaseOptions()
    ..baseUrl = baseUrl
    ..headers = baseHeaders;

  static void initialize() {
    dio = Dio(_options);
  }
}
