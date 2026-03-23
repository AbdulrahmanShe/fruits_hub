import 'package:fruits_hub/core/helper_functions/get_user.dart';
import 'package:get/get.dart';
import 'package:fruits_hub/features/checkout/domain/entites/order_entity.dart';
import 'package:fruits_hub/features/checkout/domain/entites/shipping_address_entity.dart';
import 'package:fruits_hub/features/home/domain/entites/cart_entity.dart';
import 'package:uuid/uuid.dart';

class CheckoutController extends GetxController {
  late OrderInputEntity orderEntity;

  /// الحالة
  var selectedShippingIndex = (-1).obs;

  @override
  void onInit() {
    super.onInit();

    /// cartEntity جاي من Get.arguments
    final CartEntity cartEntity = Get.arguments as CartEntity;

    orderEntity = OrderInputEntity(
      cartEntity,
      uID: getUser().uId, // لاحقًا من AuthController
      shippingAddressEntity: ShippingAddressEntity(),
    );
    orderEntity.orderId = const Uuid().v4();
    // Payment method will be selected by the user.
    orderEntity.payWithCash = null;
    selectedShippingIndex.value = -1;
  }

  // ================== Actions ==================



  void updateShippingAddress(ShippingAddressEntity address) {
    orderEntity.shippingAddressEntity = address;
  }

  // ================== Calculations ==================

  double get cartTotal =>
      orderEntity.cartEntity.calculateTotalPrice();

  double get shippingCost =>
      orderEntity.payWithCash == null ? 0 : 5;

  double get finalTotal =>
      orderEntity.calculateTotalPriceAfterDiscountAndShipping();
}

