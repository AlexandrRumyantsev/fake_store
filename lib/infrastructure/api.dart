import 'package:dio/dio.dart';

class API {
  static const String baseUrl = 'https://fakestoreapi.com';

  /// Базовый набор хэдеров для запросов
  static const Map<String, dynamic> baseHeaders = {
    'Accept': 'application/json, application/problem+json',
    'Content-Type': 'application/json',
  };

  /// Настройки клиента Dio
  static final BaseOptions _options = BaseOptions()
    ..baseUrl = baseUrl
    ..headers = baseHeaders;

  /// Dio для выполнения запросов не требующих авторизации
  static final dioForUnauthorized = Dio(_options);

  /// Клиент для работы с сетью.
  static final dio = Dio(_options);
}
