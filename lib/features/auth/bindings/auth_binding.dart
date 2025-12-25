import 'package:fruits_hub/core/services/database_service.dart';
import 'package:fruits_hub/core/services/firebase_auth_service.dart';
import 'package:fruits_hub/core/services/firestore_service.dart';
import 'package:fruits_hub/features/auth/data/repo/auth_repo_impl.dart';
import 'package:fruits_hub/features/auth/presentation/controller/auth_controller.dart';
import 'package:get/get.dart';
import 'package:fruits_hub/features/auth/domin/repos/auth_repo.dart';
class AuthBinding extends Bindings {
  @override
  void dependencies() {
     // Services
    Get.lazyPut<FirebaseAuthService>(
      () => FirebaseAuthService(),
    );

    Get.lazyPut<DatabaseService>(
      () => FireStoreService(),
    );
    // Repository
    Get.lazyPut<AuthRepo>(
      () => AuthRepoImpl(
        firebaseAuthService: Get.find<FirebaseAuthService>(),
        databaseService: Get.find<DatabaseService>(),
      ),
    );
    
    // Controller
    Get.lazyPut(
      () => AuthController(authRepo: Get.find()),
    );
  }
}
// class AuthBinding extends Bindings {
//   @override
//   void dependencies() {
//     // FirebaseAuthService يبقى دائمًا طوال عمر التطبيق
//     Get.put<FirebaseAuthService>(
//       FirebaseAuthService(),
//       permanent: true, // ⭐ مهم جدًا
//     );

//     // Repo و Controller أيضًا يمكن أن تبقى دائمًا
//     Get.put<AuthRepo>(
//       AuthRepoImpl(firebaseAuthService: Get.find()),
//       permanent: true,
//     );

//     Get.put<AuthController>(
//       AuthController(authRepo: Get.find()),
//       permanent: true,
//     );
//   }
// }

