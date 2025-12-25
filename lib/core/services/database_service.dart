abstract class DatabaseService{
//collectionName  or path => General Name (collectionName or API)
  Future<void> addData({
    required String collectionName, 
    required Map<String, dynamic> data,
    String? docuementId,
    });

    Future<Map<String, dynamic>> getData({
      required String collectionName,
      required String docuementId,
      });

      Future<bool> checkIfDataExists({
        required String collectionName, 
        required String docuementId
        });
}