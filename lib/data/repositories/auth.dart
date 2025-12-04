import '../../domain/repositories/auth.dart';
import '../data_source/api/auth.dart';
import '../models/request/auth.dart';
import '../models/response/auth.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthService authService;

  AuthRepositoryImpl({required this.authService});

  @override
  Future<AuthResponseModel> login(AuthRequestModel authRequestModel) async {
    try {
      final response = await authService.login(authRequestModel);
      return response;
    } catch (e) {
      throw Exception(e);
    }
  }
}
