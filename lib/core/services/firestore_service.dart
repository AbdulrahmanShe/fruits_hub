import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fruits_hub/core/services/database_service.dart';

class FireStoreService implements DatabaseService{
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  @override
  Future<void> addData({
    required String collectionName, 
    required Map<String, dynamic> data,
    String? docuementId,
    }) async{
    if (docuementId != null) {
  await firestore.collection(collectionName).doc(docuementId).set(data);
}else{
  await firestore.collection(collectionName).add(data);
}
  }

  @override
  Future<Map<String, dynamic>> getData({
    required String collectionName, 
    required String docuementId
    }) async{
    var data = await firestore.collection(collectionName).doc(docuementId).get();
      return data.data() as Map<String, dynamic>;
  }
  
  @override
  Future<bool> checkIfDataExists({
    required String collectionName, 
    required String docuementId}) async{
    var data = await firestore.collection(collectionName).doc(docuementId).get();
    return data.exists;
  }

}

