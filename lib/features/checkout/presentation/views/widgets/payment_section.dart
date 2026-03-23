import 'package:flutter/material.dart';
import 'package:fruits_hub/features/checkout/presentation/views/widgets/order_summry_widget.dart';
import 'package:fruits_hub/features/checkout/presentation/views/widgets/shipping_address_widget.dart';
import 'package:fruits_hub/features/checkout/presentation/views/widgets/stripe_payment_method.dart';

class PaymentSection extends StatelessWidget {
  const PaymentSection({super.key, required this.pageController});

  final PageController pageController;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.only(bottom: 24),
      child: Column(
        children: [
          const SizedBox(
            height: 24,
          ),
          OrderSummryWidget(),
          const SizedBox(
            height: 16,
          ),
          const StripePaymentMethod(),
          const SizedBox(
            height: 16,
          ),
          ShippingAddressWidget(
            pageController: pageController,
          ),
        ],
      ),
    );
  }
}
