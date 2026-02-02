import 'package:equatable/equatable.dart';
import 'package:fruits_hub/core/entities/product_entity.dart';
import 'package:get/get.dart';

class CartItemEntity extends Equatable{
  final ProductEntity productEntity;
  final RxInt quantity;

  CartItemEntity({required this.productEntity, int quantity = 1})
      : quantity = quantity.obs;

  num calculateTotalPrice() => productEntity.price * quantity.value;

  num calculateTotalWeight() => productEntity.unitAmount * quantity.value;

  increaseQuantity() => quantity.value++;
  decreasQuantity() {
  if (quantity.value > 1) quantity.value--;
}

  @override
  List<Object?> get props => [productEntity];
}
