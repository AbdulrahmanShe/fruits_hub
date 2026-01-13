import 'package:fruits_hub/core/repos/orders_repo/orders_repo.dart';
import 'package:fruits_hub/core/utils/show_snack_bar.dart';
import 'package:fruits_hub/features/checkout/domain/entites/order_entity.dart';
import 'package:get/get.dart';

class AddOrderController extends GetxController{
  final OrdersRepo ordersRepo;

  AddOrderController({required this.ordersRepo});
  final isLoading = false.obs;

  void addOrder({required OrderInputEntity order}) async {
    isLoading.value = true;
    // emit(AddOrderLoading());
    final result = await ordersRepo.addOrder(order: order);

    isLoading.value = false;
    result.fold(
      (failure) => showSnackBar('فشل', failure.message),
      // emit(AddOrderFailure(failure.message)),
      (success) => null,
      // emit(AddOrderSuccess()),
    );
  }
  
}