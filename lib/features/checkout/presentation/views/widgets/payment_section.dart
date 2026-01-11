import 'package:flutter/material.dart';
import 'package:fruits_hub/features/checkout/presentation/views/widgets/order_summry_widget.dart';

class PaymentSection extends StatelessWidget {
  const PaymentSection({super.key, required this.pageController});

  final PageController pageController;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 24,
        ),
        OrderSummryWidget(),
        
        const SizedBox(
          height: 16,
        ),
        
      ],
    );
  }
}