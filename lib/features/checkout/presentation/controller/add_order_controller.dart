import 'package:fruits_hub/core/repos/orders_repo/orders_repo.dart';
import 'package:fruits_hub/core/utils/show_snack_bar.dart';
import 'package:fruits_hub/features/checkout/domain/entites/order_entity.dart';
import 'package:fruits_hub/generated/l10n.dart';
import 'package:get/get.dart';

class AddOrderController extends GetxController{
  final OrdersRepo ordersRepo;

  AddOrderController({required this.ordersRepo});
  final isLoading = false.obs;

  Future<bool> addOrder({required OrderInputEntity order}) async {
    isLoading.value = true;
    // emit(AddOrderLoading());
    final result = await ordersRepo.addOrder(order: order);

    isLoading.value = false;
    return result.fold(
      (failure) {
        showSnackBar(S.current.failed, failure.message);
        return false;
      },
      (success) => true,
    );
  }
  
}
