import '../../data/models/request/auth.dart';
import '../../data/models/response/auth.dart';

abstract interface class AuthRepository {
  Future<AuthResponseModel> login(AuthRequestModel authRequestModel);
}
