import 'package:fruits_hub/core/controller/products_controller.dart';
import 'package:fruits_hub/core/controller/voice_search_controller.dart';
import 'package:fruits_hub/core/repos/products_repo/products_repo.dart';
import 'package:fruits_hub/core/repos/products_repo/products_repo_impl.dart';
import 'package:fruits_hub/core/services/database_service.dart';
import 'package:fruits_hub/core/services/firestore_service.dart';
import 'package:get/get.dart';
class ProductsBinding extends Bindings {
  @override
  void dependencies() {
     // Services

    Get.lazyPut<DatabaseService>(
      () => FireStoreService(),
    );
    // Repository
    Get.lazyPut<ProductsRepo>(
      () => ProductsRepoImpl(
         Get.find<DatabaseService>(),
      ),
    );
    
    // Controller
    Get.lazyPut(
      () => ProductsController(productsRepo: Get.find()),
    );

    // 🔊 Voice Search Controller
    Get.lazyPut(
      () => VoiceSearchController(),
    );
  }
}