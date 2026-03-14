import 'package:fruits_hub/features/checkout/domain/entites/order_product_entity.dart';
import '../../../home/domain/entites/car_item_entity.dart';

class OrderProductModel {
  final String name;
  final String code;
  final String imageUrl;
  final double price;
  final int quantity;

  OrderProductModel({
    required this.name,
    required this.code,
    required this.imageUrl,
    required this.price,
    required this.quantity,
  });

  factory OrderProductModel.fromJson(Map<String, dynamic> json) {
    return OrderProductModel(
      name: (json['name'] ?? '').toString(),
      code: (json['code'] ?? '').toString(),
      imageUrl: (json['imageUrl'] ?? '').toString(),
      price: (json['price'] is num)
          ? (json['price'] as num).toDouble()
          : double.tryParse(json['price'].toString()) ?? 0,
      quantity: (json['quantity'] is num)
          ? (json['quantity'] as num).toInt()
          : int.tryParse(json['quantity'].toString()) ?? 0,
    );
  }

  factory OrderProductModel.fromEntity(
      {required CartItemEntity cartItemEntity}) {
    return OrderProductModel(
      name: cartItemEntity.productEntity.name,
      code: cartItemEntity.productEntity.code,
      imageUrl: cartItemEntity.productEntity.imageUrl!,
      price: cartItemEntity.productEntity.price.toDouble(),
      quantity: cartItemEntity.quantity.value,
    );
  }

  toJson() {
    return {
      'name': name,
      'code': code,
      'imageUrl': imageUrl,
      'price': price,
      'quantity': quantity,
    };
  }

  OrderProductEntity toEntity() {
    return OrderProductEntity(
      name: name,
      code: code,
      imageUrl: imageUrl,
      price: price,
      quantity: quantity,
    );
  }
}
