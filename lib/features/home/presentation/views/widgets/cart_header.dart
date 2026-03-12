import 'package:flutter/material.dart';
import 'package:fruits_hub/features/home/presentation/controller/cart_controller.dart';
import 'package:fruits_hub/generated/l10n.dart';
import 'package:get/get.dart';

class CartHeader extends StatelessWidget {
   CartHeader({super.key});
    final CartController controller = Get.find<CartController>();

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 20),
      decoration: BoxDecoration(
        color: colors.primary.withValues(alpha: 0.12),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Center(
        child: Obx((){
          return Text(
            S.of(context).youHaveItemsInCart(controller.totalItems.toString()),
            style: TextStyle(
              color: colors.primary,
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
