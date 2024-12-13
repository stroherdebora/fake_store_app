import 'package:firebase_auth/firebase_auth.dart';

import 'i_firebase_auth_service.dart';
import '../../interactor/entities/user_entity.dart';

class FirebaseAuthService implements IAuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Future<UserEntity?> signInWithEmailAndPassword(String email, String password) async {
    try {
      final userCredential = await _auth.signInWithEmailAndPassword(email: email, password: password);
      final user = userCredential.user;

      if (user == null) {
        throw Exception('Usuário não encontrado.');
      }

      return UserEntity(
        uid: user.uid,
        email: user.email!,
        name: user.displayName,
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        throw Exception('Usuário não encontrado.');
      } else if (e.code == 'wrong-password') {
        throw Exception('Senha incorreta.');
      }
      throw Exception('Erro desconhecido: ${e.message}');
    }
  }
}
