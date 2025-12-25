import 'package:fruits_hub/features/auth/domin/entites/user_entity.dart';

abstract class DatabaseService{
//collectionName  or path => General Name (collectionName or API)
  Future<void> addData({
    required String collectionName, 
    required Map<String, dynamic> data
    });

    Future<UserEntity> getUserData({
      required String collectionName,
      required String uid,
      });
}