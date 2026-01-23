import 'package:fruits_hub/features/home/presentation/controller/cart_controller.dart';
import 'package:get/get.dart';

class GlobalBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<CartController>(
      CartController(),
      permanent: true,
    );
  }
}
// GlobalBinding نستخدمه فقط لأشياء مثل:

// Cart

// Auth

// Theme

// Language