import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fruits_hub/core/constants.dart';
import 'package:fruits_hub/core/errors/exceptions.dart';
import 'package:fruits_hub/core/errors/failures.dart';
import 'package:fruits_hub/core/services/database_service.dart';
import 'package:fruits_hub/core/services/firebase_auth_service.dart';
import 'package:fruits_hub/core/services/shared_preferences_singleton.dart';
import 'package:fruits_hub/core/utils/backend_endpoint.dart';
import 'package:fruits_hub/features/auth/data/models/user_model.dart';
import 'package:fruits_hub/features/auth/domin/entites/user_entity.dart';
import 'package:fruits_hub/features/auth/domin/repos/auth_repo.dart';

class AuthRepoImpl extends AuthRepo{
  final FirebaseAuthService firebaseAuthService;
  final DatabaseService databaseService;

  AuthRepoImpl({required this.databaseService, required this.firebaseAuthService});
  
  @override
  Future<Either<Failure, UserEntity>> createUserWithEmailAndPassword(
    //////////
    String email, String password, String name) async{
      User? user;
   try {
   user = await firebaseAuthService.createUserWithEmailAndPassword(
   email: email, password: password, name: name,);

   var userEntity = UserEntity(
    name: name,
    email: email, 
    uId: user.uid
    );
   await addUserData(user: userEntity);
   return right(
    userEntity,
   );
} on CustomException catch (e) {
  await deleteUser(user);
  return left(ServerFailure(e.message));
}catch (e) {
  await deleteUser(user);
  return left(ServerFailure(e.toString()));
}
   
  }

  Future<void> deleteUser(User? user) async {
    if (user != null) {
      await firebaseAuthService.deleteUser();
    }
  }
  
  @override
  Future<Either<Failure, UserEntity>> signInWithEmailAndPassword(
    String email, String password,) async{
      try {
  var user = await firebaseAuthService.signInWithEmailAndPassword(
   email: email, password: password,);
   var userEntity = await getUserData(uid: user.uid);
   await saveUserData(user: userEntity);
   return right(
    userEntity,
   );
} on CustomException catch (e) {
  return left(ServerFailure(e.message));
}catch (e) {
  return left(ServerFailure(e.toString()));
}
  }


  @override
Future<Either<Failure, UserEntity>> signInWithGoogle() async {
  User? user;
  try {
    user = await firebaseAuthService.signInWithGoogle();
    UserEntity userEntity = UserModel.fromFirebaseUser(user);
    final isUserExist = await databaseService.checkIfDataExists(
      collectionName: BackendEndpoint.isUserExists, 
      docuementId: user.uid
      );
      if (isUserExist) {
        userEntity = await getUserData(uid: user.uid);
      }else{
        await addUserData(user: userEntity);
      }
    await saveUserData(user: userEntity);
    return right(userEntity);
  } on CustomException catch (e) {
    return left(ServerFailure(e.message));
  } catch (e) {
    await deleteUser(user);
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
  
  
  @override
  Future addUserData({required UserEntity user}) async{
    await databaseService.addData(
      collectionName: BackendEndpoint.addUserData, 
      data: UserModel.fromEntity(user).toMap(),
      docuementId: user.uId,
      );
  }
  
  @override
  Future<UserEntity> getUserData({required String uid}) async{
    var userData = await databaseService.getData(
      collectionName: BackendEndpoint.getUsersData, 
      docuementId: uid,
      );
      return UserModel.fromJson(userData);
  }
  
  @override
  Future saveUserData({required UserEntity user}) {
    var jsonData = jsonEncode(UserModel.fromEntity(user).toMap());

    return Prefs.setString(kUserData, jsonData);
  }

}
