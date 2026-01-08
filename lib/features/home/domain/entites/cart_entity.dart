import 'package:fruits_hub/core/entities/product_entity.dart';
import 'package:fruits_hub/features/home/domain/entites/car_item_entity.dart';

class CartEntity {
  final List<CartItemEntity> cartItems;

  CartEntity(this.cartItems);

  addCartItem(CartItemEntity cartItemEntity) {
    cartItems.add(cartItemEntity);
  }

  removeCartItem(CartItemEntity carItem) {
    cartItems.remove(carItem);
  }

  double calculateTotalPrice() {
    double totalPrice = 0;
    for (var carItem in cartItems) {
      totalPrice += carItem.calculateTotalPrice();
    }
    return totalPrice;
  }

  bool isExis(ProductEntity product) {
  return cartItems.any(
    (item) => item.productEntity == product,
  );
}

CartItemEntity getCarItem(ProductEntity product) {
  return cartItems.firstWhere(
    (item) => item.productEntity.code == product.code,
    orElse: () => CartItemEntity(
      productEntity: product,
      quantity: 1,
    ),
  );
}

}