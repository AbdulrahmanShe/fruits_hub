import 'package:fruits_hub/features/home/presentation/controller/cart_controller.dart';
import 'package:fruits_hub/features/home/presentation/controller/profile_controller.dart';
import 'package:fruits_hub/core/services/database_service.dart';
import 'package:fruits_hub/core/services/firestore_service.dart';
import 'package:get/get.dart';

class GlobalBinding extends Bindings {
  @override
  void dependencies() {
    if (!Get.isRegistered<DatabaseService>()) {
      Get.put<DatabaseService>(
        FireStoreService(),
        permanent: true,
      );
    }
    Get.put<CartController>(
      CartController(),
      permanent: true,
    );
    Get.put<ProfileController>(
      ProfileController(),
      permanent: true,
    );
  }
}
// GlobalBinding نستخدمه فقط لأشياء مثل:

// Cart

// Auth

// Theme

// Language
