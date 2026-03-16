import 'package:flutter/material.dart';
import '../../../../../core/utils/app_text_styles.dart';
import 'package:fruits_hub/features/checkout/presentation/controller/checkout_controller.dart';
import 'package:fruits_hub/generated/l10n.dart';
import 'package:get/get.dart';
import 'payment_item.dart';

class OrderSummryWidget extends StatelessWidget {
  const OrderSummryWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final CheckoutController controller = Get.find<CheckoutController>();
    final colors = Theme.of(context).colorScheme;

    return PaymentItem(
      tile: S.of(context).orderSummary,
      child: Column(
        children: [
          Row(
            children: [
              Text(
                S.of(context).subtotalLabel,
                style: TextStyles.regular13.copyWith(
                  color: colors.onSurface.withValues(alpha: 0.7),
                ),
              ),
              const Spacer(),
              Text(
                controller.cartTotal.toStringAsFixed(0),
                // '20 USD',
                textAlign: TextAlign.right,
                style: TextStyles.semiBold16.copyWith(color: colors.onSurface),
              ),
            ],
          ),
          const SizedBox(
            height: 8,
          ),
          Row(
            children: [
              Text(
                S.of(context).deliveryLabel,
                style: TextStyles.regular13.copyWith(
                  color: colors.onSurface.withValues(alpha: 0.7),
                ),
              ),
              const Spacer(),
              Text(
                S.of(context).ilsAmount(controller.shippingCost.toStringAsFixed(0)),
                textAlign: TextAlign.right,
                style: TextStyles.regular13.copyWith(
                  color: colors.onSurface.withValues(alpha: 0.7),
                ),
              )
            ],
          ),
          const SizedBox(
            height: 9,
          ),
          Divider(thickness: .5, color: colors.outline.withValues(alpha: 0.4)),
          const SizedBox(
            height: 9,
          ),
          Row(
            children: [
              Text(
                S.of(context).totalLabel,
                style: TextStyles.bold16.copyWith(color: colors.onSurface),
              ),
              const Spacer(),
              Text(
                controller.finalTotal.toStringAsFixed(0),
                style: TextStyles.bold16.copyWith(color: colors.primary),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
