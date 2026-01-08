import 'package:flutter/material.dart';
import 'package:fruits_hub/features/home/presentation/controller/cart_controller.dart';
import 'package:fruits_hub/features/home/presentation/views/widgets/cart_item.dart';
import 'package:get/get.dart';

class CarItemsList extends StatelessWidget {
  const CarItemsList({super.key, });

  // final List<CartItemEntity> carItems;
  @override
  Widget build(BuildContext context) {
     final CartController controller = Get.find<CartController>();

    return Obx((){
      final carItems = controller.cartEntity.value.cartItems;
      return SliverList.separated(
          separatorBuilder: (context, index) => const CustomDivider(),
          itemCount: carItems.length ,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: CartItem(
                carItemEntity: carItems[index],
              ),
            );
          });
    }
    );
  }
}

class CustomDivider extends StatelessWidget {
  const CustomDivider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Divider(
      color: Color(0xFFF1F1F5),
      height: 22,
    );
  }
}