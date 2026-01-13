import 'package:flutter/material.dart';
import '../../../../../core/utils/app_text_styles.dart';
import 'package:fruits_hub/features/checkout/presentation/controller/checkout_controller.dart';
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
      tile: 'ملخص الطلب',
      child: Column(
        children: [
          Row(
            children: [
              Text(
                'المجموع الفرعي :',
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
                'التوصيل  :',
                style: TextStyles.regular13.copyWith(
                  color: const Color(0xFF4E5556),
                ),
              ),
              const Spacer(),
              Text(
                '30جنية',
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
              const Text(
                'الكلي',
                style: TextStyles.bold16,
              ),
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