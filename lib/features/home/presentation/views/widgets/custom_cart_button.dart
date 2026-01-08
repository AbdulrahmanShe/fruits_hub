import 'package:flutter/material.dart';
import 'package:fruits_hub/core/widgets/custom_bottom.dart';
class CustomCartButton extends StatelessWidget {
  const CustomCartButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CustomBottom(onPressed: (){}, text: 'الدفع 52 جنيه');
    // return CustomBottom(
    //       onPressed: () {
    //         if (context.read<CartCubit>().cartEntity.cartItems.isNotEmpty) {
    //           Navigator.pushNamed(
    //             context,
    //             CheckoutView.routeName,
    //             arguments: context.read<CartCubit>().cartEntity,
    //           );
    //         } else {
    //           showBar(context, 'لا يوجد منتجات في السلة');
    //         }
    //       },
    //       text:
    //           'الدفع  جنيه',//${context.watch<CartCubit>().cartEntity.calculateTotalPrice()}
    //     );
      
  }
}