import 'package:firebase_auth/firebase_auth.dart';

class UserDTO {
  final String uid;
  final String email;
  final String? name;

  UserDTO({
    required this.uid,
    required this.email,
    this.name,
  });

  factory UserDTO.fromFirebaseUser(User firebaseUser) {
    return UserDTO(
      uid: firebaseUser.uid,
      email: firebaseUser.email!,
      name: firebaseUser.displayName,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'email': email,
      'displayName': name,
    };
  }

  factory UserDTO.fromMap(Map<String, dynamic> map) {
    return UserDTO(
      uid: map['uid'],
      email: map['email'],
      name: map['displayName'],
    );
  }
}
