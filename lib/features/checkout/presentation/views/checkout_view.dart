import 'package:flutter/widgets.dart';
import 'package:fruits_hub/features/checkout/presentation/views/widgets/checkout_view_body.dart';

class CheckoutView extends StatelessWidget {
  const CheckoutView({super.key});
  static const routeName = '/checkoutView';

  @override
  Widget build(BuildContext context) {      
    return CheckoutViewBody();
  }
}