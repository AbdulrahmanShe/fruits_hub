abstract class DatabaseService{
//collectionName  or path => General Name (collectionName or API)
  Future<void> addData({
    required String collectionName, 
    required Map<String, dynamic> data,
    String? docuementId,
    });

    Future<dynamic> getData({
      required String collectionName,
       String? docuementId,
      Map<String, dynamic>? query,
      });

      Future<bool> checkIfDataExists({
        required String collectionName, 
        required String docuementId
        });

        Future<void> deleteData({
        required String collectionName,
        required String docuementId,
        });
}