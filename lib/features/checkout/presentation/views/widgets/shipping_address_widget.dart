import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:fruits_hub/core/utils/app_images.dart';
import 'package:fruits_hub/features/checkout/presentation/controller/checkout_controller.dart';
import 'package:fruits_hub/features/checkout/presentation/views/widgets/payment_item.dart';
import 'package:fruits_hub/generated/l10n.dart';
import 'package:get/get.dart';
import 'package:svg_flutter/svg_flutter.dart';
import '../../../../../core/utils/app_text_styles.dart';

class ShippingAddressWidget extends StatelessWidget {
  const ShippingAddressWidget({
    super.key,
    required this.pageController,
  });
  
  final PageController pageController;
  @override
  Widget build(BuildContext context) {
    final CheckoutController controller = Get.find<CheckoutController>();
    final colors = Theme.of(context).colorScheme;
    log(controller.orderEntity.toString());
    return PaymentItem(
      tile: S.of(context).shippingAddress,
      child: Row(
        children: [
          SvgPicture.asset(
            Assets.imagesLocation,
          ),
          const SizedBox(
            width: 8,
          ),
          Expanded(
            child: Text(
              ' ${controller.orderEntity.shippingAddressEntity}',
              textAlign: TextAlign.right,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: TextStyles.regular13.copyWith(
                color: colors.onSurface.withValues(alpha: 0.7),
              ),
            ),
          ),
          const Spacer(),
          GestureDetector(
            onTap: () {
              pageController.animateToPage(1,
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeIn);
            },
            child: SizedBox(
              child: Row(
                children: [
                  SvgPicture.asset(
                    Assets.imagesEdit,
                  ),
                  const SizedBox(
                    width: 4,
                  ),
                  Text(
                    S.of(context).edit,
                    style: TextStyles.semiBold13.copyWith(
                      color: colors.onSurface.withValues(alpha: 0.6),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
