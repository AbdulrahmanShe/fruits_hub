import 'package:flutter/material.dart';
import 'package:fruits_hub/features/checkout/presentation/views/widgets/step_item.dart';
import 'package:fruits_hub/generated/l10n.dart';

class CheckoutSteps extends StatelessWidget {
  const CheckoutSteps(
      {super.key,
      required this.currentPageIndex,
      required this.pageController, required this.onTap});

  final int currentPageIndex;
  final PageController pageController;
  final ValueChanged<int> onTap;
  @override
  Widget build(BuildContext context) {
    return Row(
        children: List.generate(getSteps(context).length, (index) {
          return Expanded(
            child: GestureDetector(
              onTap: () {
                onTap(index);
              },
              child: StepItem(
                isActive: index <= currentPageIndex,
                index: (index + 1).toString(),
                text: getSteps(context)[index],
              ),
            ),
          );
        }),
    );
  }
}

List<String> getSteps(BuildContext context) {
  return [
    S.of(context).shipping,
    S.of(context).address,
    S.of(context).payment,
  ];
}
