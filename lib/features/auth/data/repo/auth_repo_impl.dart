import 'package:dartz/dartz.dart';
import 'package:fruits_hub/core/errors/exceptions.dart';
import 'package:fruits_hub/core/errors/failures.dart';
import 'package:fruits_hub/core/services/firebase_auth_service.dart';
import 'package:fruits_hub/features/auth/data/models/user_model.dart';
import 'package:fruits_hub/features/auth/domin/entites/user_entity.dart';
import 'package:fruits_hub/features/auth/domin/repos/auth_repo.dart';

class AuthRepoImpl extends AuthRepo{
  final FirebaseAuthService firebaseAuthService;

  AuthRepoImpl({required this.firebaseAuthService});
  
  @override
  Future<Either<Failure, UserEntity>> createUserWithEmailAndPassword(
    //////////
    String email, String password, String name) async{
   try {
  var user = await firebaseAuthService.createUserWithEmailAndPassword(
   email: email, password: password, name: name,);
   return right(
    UserModel.fromFirebaseUser(user),
   );
} on CustomException catch (e) {
  return left(ServerFailure(e.message));
}catch (e) {
  return left(ServerFailure(e.toString()));
}
   
  }
  
  @override
  Future<Either<Failure, UserEntity>> signInWithEmailAndPassword(
    String email, String password,) async{
      try {
  var user = await firebaseAuthService.signInWithEmailAndPassword(
   email: email, password: password,);
   return right(
    UserModel.fromFirebaseUser(user),
   );
} on CustomException catch (e) {
  return left(ServerFailure(e.message));
}catch (e) {
  return left(ServerFailure(e.toString()));
}
  }


  @override
Future<Either<Failure, UserEntity>> signInWithGoogle() async {
  try {
    final user = await firebaseAuthService.signInWithGoogle();
    return right(UserModel.fromFirebaseUser(user));
  } on CustomException catch (e) {
    return left(ServerFailure(e.message));
  } catch (e) {
    return left(ServerFailure(e.toString()));
  }
}

@override
Future<Either<Failure, UserEntity>> signInWithFacebook() async {
  try {
    final user = await firebaseAuthService.signInWithFacebook();
    return right(UserModel.fromFirebaseUser(user));
  } on CustomException catch (e) {
    return left(ServerFailure(e.message));
  } catch (e) {
    return left(ServerFailure(e.toString()));
  }
}

  
 /* ================= Password Reset ================= */

  @override
  Future<Either<Failure, Unit>> sendPasswordResetEmail(
    String email,
  ) async {
    try {
      await firebaseAuthService.sendPasswordResetEmail(email);
      return right(unit);
    } on CustomException catch (e) {
      return left(ServerFailure(e.message));
    } catch (e) {
      return left(ServerFailure(e.toString()));
    }
  }

}