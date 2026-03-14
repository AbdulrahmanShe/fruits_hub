import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fruits_hub/features/checkout/data/models/order_product_model.dart';
import 'package:fruits_hub/features/checkout/data/models/shipping_address_model.dart';
import 'package:fruits_hub/features/checkout/domain/entites/order_history_entity.dart';

class OrderHistoryModel {
  final String orderId;
  final String userId;
  final double totalPrice;
  final String paymentMethod;
  final DateTime? createdAt;
  final String? createdAtRaw;
  final String status;
  final ShippingAddressModel shippingAddressModel;
  final List<OrderProductModel> orderProducts;

  OrderHistoryModel({
    required this.orderId,
    required this.userId,
    required this.totalPrice,
    required this.paymentMethod,
    required this.createdAt,
    required this.createdAtRaw,
    required this.status,
    required this.shippingAddressModel,
    required this.orderProducts,
  });

  factory OrderHistoryModel.fromJson(Map<String, dynamic> json) {
    final rawDate = json['date'];
    DateTime? parsedDate;
    String? rawDateString;

    if (rawDate is Timestamp) {
      parsedDate = rawDate.toDate();
      rawDateString = rawDate.toDate().toIso8601String();
    } else if (rawDate != null) {
      rawDateString = rawDate.toString();
      parsedDate = DateTime.tryParse(rawDateString);
    }

    final products = (json['orderProducts'] as List<dynamic>? ?? [])
        .whereType<Map<String, dynamic>>()
        .map(OrderProductModel.fromJson)
        .toList();

    return OrderHistoryModel(
      orderId: (json['orderId'] ?? '').toString(),
      userId: (json['uId'] ?? '').toString(),
      totalPrice: (json['totalPrice'] is num)
          ? (json['totalPrice'] as num).toDouble()
          : double.tryParse(json['totalPrice'].toString()) ?? 0,
      paymentMethod: (json['paymentMethod'] ?? '').toString(),
      createdAt: parsedDate,
      createdAtRaw: rawDateString,
      status: (json['status'] ?? '').toString(),
      shippingAddressModel: ShippingAddressModel.fromJson(
        (json['shippingAddressModel'] as Map<String, dynamic>? ?? {}),
      ),
      orderProducts: products,
    );
  }

  OrderHistoryEntity toEntity() {
    return OrderHistoryEntity(
      orderId: orderId,
      userId: userId,
      totalPrice: totalPrice,
      paymentMethod: paymentMethod,
      createdAt: createdAt,
      createdAtRaw: createdAtRaw,
      status: status,
      shippingAddress: shippingAddressModel.toEntity(),
      items: orderProducts.map((item) => item.toEntity()).toList(),
    );
  }
}
