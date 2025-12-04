import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';

import '../models/request/auth.dart';
import '../models/response/auth.dart';

part 'auth.g.dart';

/// Клиент для работы с авторизацией
@RestApi()
abstract class AuthClient {
  factory AuthClient(Dio dio) = _AuthClient;
  
  @POST('/auth/login')
  Future<AuthResponseModel> login(@Body() AuthRequestModel authRequestModel);
}
