import 'package:firebase_auth/firebase_auth.dart';
import 'package:fruits_hub/core/repos/orders_repo/orders_repo.dart';
import 'package:fruits_hub/core/repos/orders_repo/orders_repo_impl.dart';
import 'package:fruits_hub/core/services/database_service.dart';
import 'package:fruits_hub/core/services/firestore_service.dart';
import 'package:fruits_hub/features/home/presentation/controller/orders_controller.dart';
import 'package:get/get.dart';

class OrdersBinding extends Bindings {
  @override
  void dependencies() {
    if (!Get.isRegistered<DatabaseService>()) {
      Get.lazyPut<DatabaseService>(
        () => FireStoreService(),
        fenix: true,
      );
    }

    if (!Get.isRegistered<OrdersRepo>()) {
      Get.lazyPut<OrdersRepo>(
        () => OrdersRepoImpl(Get.find<DatabaseService>()),
        fenix: true,
      );
    }

    Get.lazyPut<OrdersController>(
      () {
        final user = FirebaseAuth.instance.currentUser;
        if (user == null) {
          throw Exception('User not logged in');
        }
        return OrdersController(
          ordersRepo: Get.find(),
          userId: user.uid,
        );
      },
    );
  }
}
