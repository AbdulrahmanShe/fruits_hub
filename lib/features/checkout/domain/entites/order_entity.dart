import 'package:fruits_hub/features/checkout/domain/entites/shipping_address_entity.dart';
import 'package:fruits_hub/features/home/domain/entites/cart_entity.dart';

class OrderInputEntity {
  final String uID;
  final CartEntity cartEntity;
  String orderId;
  bool? payWithCash;
  ShippingAddressEntity shippingAddressEntity;
  OrderInputEntity(
    this.cartEntity, {
    this.orderId = '',
    this.payWithCash,
    required this.shippingAddressEntity,
    required this.uID,
  });

  double calculateShippingCost() {
    if (payWithCash == null) {
      return 0;
    }
    return 5;
  }

  double calcualteShippingDiscount() {
    return 0;
  }

  double calculateTotalPriceAfterDiscountAndShipping() {
    return cartEntity.calculateTotalPrice() +
        calculateShippingCost() -
        calcualteShippingDiscount();
  }

  @override
  String toString() {
    return 'OrderEntity{uID: $uID, cartEntity: $cartEntity, orderId: $orderId, payWithCash: $payWithCash, shippingAddressEntity: $shippingAddressEntity}';
  }
}
