import 'package:fruits_hub/core/repos/orders_repo/orders_repo.dart';
import 'package:fruits_hub/core/repos/orders_repo/orders_repo_impl.dart';
import 'package:fruits_hub/core/services/database_service.dart';
import 'package:fruits_hub/features/checkout/presentation/controller/add_order_controller.dart';
import 'package:fruits_hub/features/checkout/presentation/controller/checkout_controller.dart';
import 'package:get/get.dart';

class CheckoutBinding extends Bindings {
  @override
  void dependencies() {

    Get.lazyPut<OrdersRepo>(
      () => OrdersRepoImpl(
         Get.find<DatabaseService>(),
      ),
    );
    
    Get.lazyPut<CheckoutController>(
      () => CheckoutController()
      
      );

    Get.lazyPut<AddOrderController>(
      () => AddOrderController(
        ordersRepo: Get.find()
        )
        );

  }
}
