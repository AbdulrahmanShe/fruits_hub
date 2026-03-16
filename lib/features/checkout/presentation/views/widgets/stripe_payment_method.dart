import 'package:flutter/material.dart';
import 'package:fruits_hub/core/utils/app_text_styles.dart';
import 'package:fruits_hub/features/checkout/presentation/controller/checkout_controller.dart';
import 'package:fruits_hub/features/checkout/presentation/views/widgets/payment_item.dart';
import 'package:fruits_hub/generated/l10n.dart';
import 'package:get/get.dart';

class StripePaymentMethod extends StatelessWidget {
  const StripePaymentMethod({super.key});

  @override
  Widget build(BuildContext context) {
    final CheckoutController controller = Get.find<CheckoutController>();
    final colors = Theme.of(context).colorScheme;
    final payWithCash = controller.orderEntity.payWithCash;
    final hasSelection = payWithCash != null;
    final methodLabel = payWithCash == true
        ? S.of(context).cashOnDelivery
        : S.of(context).payWithStripe;

    return PaymentItem(
      tile: S.of(context).payment,
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
            decoration: BoxDecoration(
              color: colors.primary.withValues(alpha: 0.12),
              borderRadius: BorderRadius.circular(6),
            ),
            child: Text(
              payWithCash == true ? 'Cash' : 'Stripe',
              style: TextStyles.semiBold13.copyWith(color: colors.primary),
            ),
          ),
          const SizedBox(width: 10),
          Text(
            hasSelection
                ? methodLabel
                : S.of(context).pleaseSelectPaymentMethod,
            style: TextStyles.regular13.copyWith(
              color: colors.onSurface.withValues(alpha: 0.7),
            ),
          ),
          const Spacer(),
          if (hasSelection)
            Icon(
              Icons.check_circle,
              size: 18,
              color: colors.primary,
            ),
        ],
      ),
    );
  }
}
