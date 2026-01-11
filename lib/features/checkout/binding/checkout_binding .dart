import 'package:fruits_hub/features/checkout/presentation/controller/checkout_controller.dart';
import 'package:get/get.dart';

class CheckoutBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(CheckoutController());
  }
}
