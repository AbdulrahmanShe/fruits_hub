import 'package:fruits_hub/core/repos/orders_repo/orders_repo.dart';
import 'package:fruits_hub/core/utils/show_snack_bar.dart';
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

  Future<void> fetchOrders() async {
    if (orders.isNotEmpty) return;
    await _loadOrders();
  }

  Future<void> refreshOrders() async {
    orders.clear();
    await _loadOrders();
  }

  Future<void> _loadOrders() async {
    if (isLoading.value) return;
    isLoading.value = true;
    errorMessage.value = '';

    final result = await ordersRepo.getOrders(userId: userId);
    isLoading.value = false;

    result.fold(
      (failure) {
        errorMessage.value = failure.message;
        showSnackBar(S.current.error, failure.message);
      },
      (items) {
        orders.assignAll(items);
      },
    );
  }

  @override
  void onInit() {
    super.onInit();
    fetchOrders();
  }
}
