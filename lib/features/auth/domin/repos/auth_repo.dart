import 'package:dartz/dartz.dart';
import 'package:fruits_hub/core/errors/failures.dart';
import 'package:fruits_hub/features/auth/domin/entites/user_entity.dart';

abstract class AuthRepo {

  // Register
  Future<Either<Failure, UserEntity>> createUserWithEmailAndPassword(
    String email,
    String password,
    String name,
  );

  // Login
  Future<Either<Failure, UserEntity>> signInWithEmailAndPassword(
    String email,
    String password,
  );

  // Google
  Future<Either<Failure, UserEntity>> signInWithGoogle();


  // Password reset (Email)
  Future<Either<Failure, Unit>> sendPasswordResetEmail(
    String email,
  );

  Future addUserData({required UserEntity user});

  Future saveUserData({required UserEntity user});

  Future<UserEntity> getUserData({required String uid});
}