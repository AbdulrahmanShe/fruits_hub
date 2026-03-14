import 'package:fruits_hub/features/checkout/domain/entites/order_product_entity.dart';
import 'package:fruits_hub/features/checkout/domain/entites/shipping_address_entity.dart';

class OrderHistoryEntity {
  final String orderId;
  final String userId;
  final double totalPrice;
  final String paymentMethod;
  final DateTime? createdAt;
  final String? createdAtRaw;
  final String status;
  final ShippingAddressEntity shippingAddress;
  final List<OrderProductEntity> items;

  const OrderHistoryEntity({
    required this.orderId,
    required this.userId,
    required this.totalPrice,
    required this.paymentMethod,
    required this.createdAt,
    required this.createdAtRaw,
    required this.status,
    required this.shippingAddress,
    required this.items,
  });

  int get totalQuantity =>
      items.fold<int>(0, (sum, item) => sum + item.quantity);

  double get subtotal => items.fold<double>(
        0,
        (sum, item) => sum + (item.price * item.quantity),
      );

  double get shippingCost =>
      paymentMethod.toLowerCase() == 'cash' ? 10 : 5;

  double get totalWithShipping => subtotal + shippingCost;

  String get displayOrderNumber {
    if (orderId.isEmpty) return '#---';
    final visible = orderId.length > 7 ? orderId.substring(0, 7) : orderId;
    return '#$visible';
  }
}
