import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fruits_hub/core/services/database_service.dart';
import 'package:fruits_hub/features/auth/data/models/user_model.dart';
import 'package:fruits_hub/features/auth/domin/entites/user_entity.dart';

class FireStoreService implements DatabaseService{
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  @override
  Future<void> addData({
    required String collectionName, 
    required Map<String, dynamic> data
    }) async{
    await firestore.collection(collectionName).add(data);
  }

  @override
  Future<UserEntity> getUserData({
    required String collectionName, 
    required String uid
    }) async{
    var data = await firestore.collection(collectionName).doc(uid).get();
      return UserModel.fromJson(data.data() as Map<String, dynamic>);
  }

}

