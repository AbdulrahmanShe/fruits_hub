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

    return PaymentItem(
      tile: S.of(context).orderSummary,
      child: Column(
        children: [
          Row(
            children: [
              Text(
                S.of(context).subtotalLabel,
                style: TextStyles.regular13.copyWith(
                  color: const Color(0xFF4E5556),
                ),
              ),
              const Spacer(),
              Text(
                controller.cartTotal.toStringAsFixed(0),
                // '20 USD',
                textAlign: TextAlign.right,
                style: TextStyles.semiBold16,
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
                  color: const Color(0xFF4E5556),
                ),
              ),
              const Spacer(),
              Text(
                S.of(context).ilsAmount('30'),
                textAlign: TextAlign.right,
                style: TextStyles.regular13.copyWith(
                  color: const Color(0xFF4E5556),
                ),
              )
            ],
          ),
          const SizedBox(
            height: 9,
          ),
          const Divider(
            thickness: .5,
            color: Color(0xFFCACECE),
          ),
          const SizedBox(
            height: 9,
          ),
          Row(
            children: [
              Text(S.of(context).totalLabel, style: TextStyles.bold16),
              const Spacer(),
              Text(
                (controller.cartTotal + 30).toStringAsFixed(0),
                style: TextStyles.bold16,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
