import 'package:fruits_hub/core/entities/product_entity.dart';
import 'package:fruits_hub/features/home/domain/entites/car_item_entity.dart';
import 'package:fruits_hub/features/home/domain/entites/cart_entity.dart';
import 'package:get/get.dart';

class CartController extends GetxController{
 final  cartEntity = CartEntity([]).obs;

  void addProduct(ProductEntity productEntity) {
    final cart = cartEntity.value;
    final isProductExist = cart.isExis(productEntity);
    final cartItem = cart.getCarItem(productEntity);

    if (isProductExist) {
      cartItem.increaseQuantity();
      Get.snackbar(
        'نجاح',
        'تمت الاضافة بنجاح',
        snackPosition: SnackPosition.BOTTOM,
      );
    } else {
      cart.addCartItem(cartItem);
       Get.snackbar(
        'نجاح',
        'تمت الاضافة بنجاح',
        snackPosition: SnackPosition.BOTTOM,
      );
    }
    cartEntity.refresh();
    // emit(CartItemAdded());
  }

   void deleteCarItem(CartItemEntity carItem) {
    cartEntity.value.removeCartItem(carItem);
    cartEntity.refresh();
     Get.snackbar(
        'نجاح',
        'تم الحذف بنجاح',
        snackPosition: SnackPosition.BOTTOM,
      );
    // emit(CartItemRemoved());
  }

  void clearCart() {
  cartEntity.value.cartItems.clear();
  cartEntity.refresh();
}

  int get totalItems => cartEntity.value.cartItems.fold(
    0,
     (sum, item) => sum + item.quantity.value
     );

  double get totalPrice => cartEntity.value.calculateTotalPrice();

}
