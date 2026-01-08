import 'package:flutter/material.dart';
import 'package:fruits_hub/core/constants.dart';
import 'package:fruits_hub/core/widgets/custom_app_bar_notification.dart';
import 'package:fruits_hub/features/home/presentation/views/widgets/car_items_list.dart';
import 'package:fruits_hub/features/home/presentation/views/widgets/cart_header.dart';
import 'package:fruits_hub/features/home/presentation/views/widgets/cart_item.dart';
import 'custom_cart_button.dart';

class CartViewBody extends StatelessWidget {
  const CartViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Column(
                children: [
                  const SizedBox(
                    height: kTopPaddding,
                  ),
                  buildAppBarNotification(
                    title: 'السلة',
                    showNotification: false,
                  ),
                  const SizedBox( 
                    height: 16,
                  ),
                  const CartHeader(),
                  const SizedBox(
                    height: 12,
                  ),

                  // const CartItem(),
                ],
              ),
            ),
            SliverToBoxAdapter(
              child: 
              // context.read<CartCubit>().cartEntity.cartItems.isEmpty
              //     ? const SizedBox()
              //     : 
                  const CustomDivider(),
            ),
            CarItemsList(
              // carItems: context.watch<CartCubit>().cartEntity.cartItems,
            ),
            SliverToBoxAdapter(
              child: 
              // context.read<CartCubit>().cartEntity.cartItems.isEmpty
              //     ? const SizedBox()
              //     : 
                  const CustomDivider(),
            ),
          ],
        ),
        Positioned(
          left: 16,
          right: 16,
          bottom: MediaQuery.sizeOf(context).height * .07,
          child: const CustomCartButton(),
        )
      ],
    );
  }
}