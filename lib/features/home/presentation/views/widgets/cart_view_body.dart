import 'package:flutter/material.dart';
import 'package:fruits_hub/core/constants.dart';
import 'package:fruits_hub/generated/l10n.dart';
import 'package:fruits_hub/core/widgets/custom_app_bar.dart';
import 'package:fruits_hub/features/home/presentation/controller/cart_controller.dart';
import 'package:fruits_hub/features/home/presentation/views/widgets/car_items_list.dart';
import 'package:fruits_hub/features/home/presentation/views/widgets/cart_header.dart';
import 'package:fruits_hub/features/home/presentation/views/widgets/custom_error_widget.dart';
import 'package:get/get.dart';
import 'custom_cart_button.dart';

class CartViewBody extends StatelessWidget {
   CartViewBody({super.key});
  final CartController controller = Get.find<CartController>();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Obx((){
          return CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: Column(
                  children: [
                    const SizedBox(
                      height: kTopPaddding,
                    ),
                    buildAppBar(
                      context,
                      title: S.of(context).cart,
                      showBackBottom: false,
                    ),
                    const SizedBox( 
                      height: 16,
                    ),
                     CartHeader(),
                    const SizedBox(
                      height: 12,
                    ),
          
                    // const CartItem(),
                  ],
                ),
              ),
              /// لو السلة فاضية
              if (controller.cartEntity.value.cartItems.isEmpty)
                SliverToBoxAdapter(
                  child: CustomErrorWidget(
                    text: S.of(context).cartIsEmpty,
                    icon: Icons.shopping_cart_outlined,
                    padding: const EdgeInsets.only(top: 48, left: 24, right: 24),
                  ),
                )

              /// لو فيها عناصر
              else ...[
                const SliverToBoxAdapter(child: CustomDivider()),
                const CarItemsList(), // ✅ Sliver مباشر
                const SliverToBoxAdapter(child: CustomDivider()),
            ],
            ],
          );
        }
        ),
        Positioned(
          left: 16,
          right: 16,
          bottom: MediaQuery.sizeOf(context).height * .07,
          child: CustomCartButton(),
        )
      ],
    );
  }
}
