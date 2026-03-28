import 'package:flutter/material.dart';
import 'package:fruits_hub/core/widgets/custom_app_bar.dart';
import 'package:fruits_hub/features/checkout/presentation/views/widgets/checkout_view_body.dart';
import 'package:fruits_hub/generated/l10n.dart';

class CheckoutView extends StatefulWidget {
  const CheckoutView({super.key});
  static const routeName = '/checkoutView';

  @override
  State<CheckoutView> createState() => _CheckoutViewState();
}

class _CheckoutViewState extends State<CheckoutView> {
  final ValueNotifier<int> _stepIndex = ValueNotifier<int>(0);

  @override
  void dispose() {
    _stepIndex.dispose();
    super.dispose();
  }

  String _titleForIndex(BuildContext context, int index) {
    final s = S.of(context);
    switch (index) {
      case 0:
        return s.shipping;
      case 1:
        return s.address;
      case 2:
        return s.payment;
      default:
        return s.checkoutTitle;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(kToolbarHeight),
        child: ValueListenableBuilder<int>(
          valueListenable: _stepIndex,
          builder: (context, value, _) {
            return buildAppBar(context, title: _titleForIndex(context, value));
          },
        ),
      ),
      body: CheckoutViewBody(stepIndex: _stepIndex),
    );
  }
}
