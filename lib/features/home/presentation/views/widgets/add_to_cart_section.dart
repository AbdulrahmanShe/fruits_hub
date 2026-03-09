import 'package:flutter/material.dart';
import 'package:fruits_hub/core/entities/product_entity.dart';
import 'package:fruits_hub/core/utils/app_colors.dart';
import 'package:fruits_hub/core/utils/app_text_styles.dart';
import 'package:fruits_hub/generated/l10n.dart';
import 'package:fruits_hub/features/home/presentation/controller/cart_controller.dart';
import 'package:fruits_hub/features/home/presentation/views/cart_view.dart';
import 'package:get/get.dart';

class AddToCartSection extends StatelessWidget {
  const AddToCartSection({super.key, required this.product});

  final ProductEntity product;
  
  @override
  Widget build(BuildContext context) {
    final CartController controller = Get.find<CartController>();
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: ElevatedButton(
        onPressed: (){
          if (controller.cartEntity.value.isExis(product)) {
              Get.to(() => const CartView());

            } else {
              controller.addProduct(product);
              Get.to(() => const CartView());

            }
          },
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        child: Text(
          S.of(context).addToCart,
          style: TextStyles.bold16.copyWith(color: Colors.white),
        ),
      ),
    );
  }
}
