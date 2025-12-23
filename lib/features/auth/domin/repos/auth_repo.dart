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

  // ===== Password Reset =====

  /// Email reset
  Future<Either<Failure, Unit>> sendPasswordResetEmail(
    String email,
  );

}
