import 'package:firebase_auth/firebase_auth.dart';
import 'package:fruits_hub/features/auth/domin/entites/user_entity.dart';

class UserModel extends UserEntity {
  UserModel({
    required super.name,
    required super.email,
    required super.uId,
    super.role,
  });

// Firebase Auth (fromFirebaseUser)

// Firestore (toMap, fromJson)

// Domain Layer (fromEntity)

  factory UserModel.fromFirebaseUser(User user) {
    return UserModel(
      name: user.displayName ?? '',
      email: user.email ?? '',
      uId: user.uid,
    );
  }

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      name: json['name'] ?? '',
      email: json['email'] ?? '',
      uId: json['uId'] ?? '',
      role: json['role'] ?? 'viewer',
    );
  }

  factory UserModel.fromEntity(UserEntity user) {
    return UserModel(
      name: user.name,
      email: user.email,
      uId: user.uId,
      role: user.role,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'email': email,
      'uId': uId,
      'role': role,
    };
  }
}