import '../../domain/entities/auth.dart';
import '../models/request/auth.dart';

class AuthMapper {
  static AuthRequestModel toModel(AuthEntity entity) => AuthRequestModel(
        username: entity.username,
        password: entity.password,
      );
}
