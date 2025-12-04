import '../../models/request/auth.dart';
import '../../models/response/auth.dart';
import '../../rest/auth.dart';

class AuthService {
  final AuthClient authClient;

  AuthService({required this.authClient});

  Future<AuthResponseModel> login(AuthRequestModel authRequestModel) async {
    return authClient.login(authRequestModel);
  }
}
