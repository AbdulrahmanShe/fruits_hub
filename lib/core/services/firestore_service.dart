import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fruits_hub/core/services/database_service.dart';

class FireStoreService implements DatabaseService {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  @override
  Future<void> addData({
    required String collectionName,
    required Map<String, dynamic> data,
    String? docuementId,
  }) async {
    if (docuementId != null) {
      await firestore.collection(collectionName).doc(docuementId).set(data);
    } else {
      await firestore.collection(collectionName).add(data);
    }
  }

  @override
  Future<dynamic> getData({
    required String collectionName,
    String? docuementId,
    Map<String, dynamic>? query,
  }) async {
    if (docuementId != null) {
      var data =
          await firestore.collection(collectionName).doc(docuementId).get();
      final map = data.data();
      if (map == null) return null;
      return {...map, 'productId': data.id};
    } else {
      Query<Map<String, dynamic>> data = firestore.collection(collectionName);
      if (query != null) {
        if (query['whereField'] != null) {
          var whereField = query['whereField'];
          var whereValue = query['whereValue'];
          data = data.where(whereField, isEqualTo: whereValue);
        }
        if (query['orderBy'] != null) {
          var orderByField = query['orderBy'];
          var descending = query['descending'];
          data = data.orderBy(orderByField, descending: descending);
        }

        if (query['limit'] != null) {
          var limit = query['limit'];
          data = data.limit(limit);
        }
      }
      var result = await data.get();
      return result.docs.map((e) {
        return {...e.data(), 'productId': e.id};
      }).toList();
    }
  }

  @override
  Future<bool> checkIfDataExists({
    required String collectionName,
    required String docuementId,
  }) async {
    var data =
        await firestore.collection(collectionName).doc(docuementId).get();
    return data.exists;
  }

  @override
  Future<void> deleteData({
    required String collectionName,
    required String docuementId,
  }) async {
    await firestore.collection(collectionName).doc(docuementId).delete();
  }
}
