import '../../interactor/entities/user_entity.dart';

abstract class IAuthService {
  Future<UserEntity?> signInWithEmailAndPassword(String email, String password);
}
