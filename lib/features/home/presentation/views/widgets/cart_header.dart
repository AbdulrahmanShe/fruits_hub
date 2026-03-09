import 'package:flutter/material.dart';
import 'package:fruits_hub/features/home/presentation/controller/cart_controller.dart';
import 'package:fruits_hub/generated/l10n.dart';
import 'package:get/get.dart';

class CartHeader extends StatelessWidget {
   CartHeader({super.key});
    final CartController controller = Get.find<CartController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 20),
      decoration: const BoxDecoration(color: Color(0xFFEBF9F1)),
      child: Center(
        child: Obx((){
          return Text(
            S.of(context).youHaveItemsInCart(controller.totalItems.toString()),
            style: const TextStyle(
              color: Color(0xFF1B5E37),
              fontSize: 13,
              fontFamily: 'Cairo',
              fontWeight: FontWeight.w400,
              height: 0.12,
            ),
          );
        }
        ),
      ),
    );
  }
}
