import 'package:flutter/material.dart';
import 'package:fruits_hub/features/checkout/presentation/controller/checkout_controller.dart';
import 'package:fruits_hub/features/checkout/presentation/views/widgets/shipping_item.dart';
import 'package:fruits_hub/generated/l10n.dart';
import 'package:get/get.dart';

class ShippingSection extends StatefulWidget {
  const ShippingSection({super.key});

  @override
  State<ShippingSection> createState() => _ShippingSectionState();
}

class _ShippingSectionState extends State<ShippingSection> with AutomaticKeepAliveClientMixin{
  @override
  Widget build(BuildContext context) {
    super.build(context);
    final CheckoutController controller = Get.find<CheckoutController>();
    return Column(
      children: [
        const SizedBox(
          height: 33,
        ),

        ShippingItem(
          onTap: () {
            controller.selectedShippingIndex.value = 0;
            setState(() {});
            controller.orderEntity.payWithCash = true;
          },
          isSelected: controller.selectedShippingIndex.value == 0,
          title: S.of(context).cashOnDelivery,
          subTitle: S.of(context).deliveryFromLocation,
          price: (5).toStringAsFixed(0),
        ),
        const SizedBox(
          height: 16,
        ),
        ShippingItem(
          onTap: () {
            controller.selectedShippingIndex.value = 1;
            setState(() {});
            controller.orderEntity.payWithCash = false;
          },
          isSelected: controller.selectedShippingIndex.value == 1,
          title: S.of(context).payWithStripe,
          subTitle: S.of(context).onlinePayment,
          price: (5).toStringAsFixed(0),
        ),
      ],
    );
  }

  @override
  bool get wantKeepAlive => true;
}
