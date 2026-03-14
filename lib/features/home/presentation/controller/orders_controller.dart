import 'package:fruits_hub/core/repos/orders_repo/orders_repo.dart';
import 'package:fruits_hub/features/checkout/domain/entites/order_history_entity.dart';
import 'package:fruits_hub/generated/l10n.dart';
import 'package:get/get.dart';

class OrdersController extends GetxController {
  final OrdersRepo ordersRepo;
  final String userId;

  OrdersController({
    required this.ordersRepo,
    required this.userId,
  });

  final isLoading = false.obs;
  final orders = <OrderHistoryEntity>[].obs;
  final errorMessage = ''.obs;

  Future<void> fetchOrders({bool force = false}) async {
    if (!force && orders.isNotEmpty) return;
    isLoading.value = true;
    errorMessage.value = '';
    if (force) {
      orders.clear();
    }

    final result = await ordersRepo.getOrders(userId: userId);
    isLoading.value = false;

    result.fold(
      (failure) {
        errorMessage.value = failure.message;
        Get.snackbar(
          S.current.error,
          failure.message,
          snackPosition: SnackPosition.BOTTOM,
        );
      },
      (items) {
        orders.assignAll(items);
      },
    );
  }

  Future<void> refreshOrders() => fetchOrders(force: true);

  @override
  void onInit() {
    super.onInit();
    fetchOrders();
  }
}
