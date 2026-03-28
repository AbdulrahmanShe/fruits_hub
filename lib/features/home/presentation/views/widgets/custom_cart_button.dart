import 'package:flutter/material.dart';
import 'package:fruits_hub/core/widgets/custom_bottom.dart';
import 'package:fruits_hub/core/utils/show_snack_bar.dart';
import 'package:fruits_hub/generated/l10n.dart';
import 'package:fruits_hub/features/checkout/presentation/views/checkout_view.dart';
import 'package:fruits_hub/features/home/presentation/controller/cart_controller.dart';
import 'package:get/get.dart';
class CustomCartButton extends StatelessWidget {
   CustomCartButton({
    super.key,
  });

  final CartController controller = Get.find<CartController>();


  @override
  Widget build(BuildContext context) {
    return Obx((){
      final isNotEmpty = controller.cartEntity.value.cartItems.isNotEmpty;
      return CustomBottom(
            onPressed: () {
              if (isNotEmpty) {
                Get.toNamed(
                  CheckoutView.routeName,
                  arguments: controller.cartEntity.value,
                );
              } else {
                showSnackBar(
                  S.of(context).alertExclamation,
                  S.of(context).noProductsInCart,
                );
              }
            },
             text:
                S.of(context).paymentAmount(controller.totalPrice.toStringAsFixed(0)),
          );
    }
    );
      
  }
}
