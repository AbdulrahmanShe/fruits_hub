import 'package:flutter/material.dart';
import 'package:fruits_hub/core/utils/show_snack_bar.dart';
import 'package:fruits_hub/core/widgets/custom_bottom.dart';
import 'package:fruits_hub/features/checkout/presentation/controller/add_order_controller.dart';
import 'package:fruits_hub/features/checkout/presentation/controller/checkout_controller.dart';
import 'package:fruits_hub/features/checkout/presentation/views/widgets/checkout_steps.dart';
import 'package:fruits_hub/features/checkout/presentation/views/widgets/checkout_steps_page_view.dart';
import 'package:get/get.dart';

class CheckoutViewBody extends StatefulWidget {
  const CheckoutViewBody({super.key,});
  

  @override
  State<CheckoutViewBody> createState() => _CheckoutViewBodyState();
}

class _CheckoutViewBodyState extends State<CheckoutViewBody> {
  late PageController pageController;
  ValueNotifier<AutovalidateMode> valueNotifier =
    ValueNotifier(AutovalidateMode.disabled);


    @override
  void initState() {
    pageController = PageController();
    pageController.addListener(() {
      setState(() {
        currentPageIndex = pageController.page!.toInt();
      });
    });
    super.initState();
  }

   @override
  void dispose() {
    pageController.dispose();
    valueNotifier.dispose();
    super.dispose();
  }

  int currentPageIndex = 0;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final controllerCheckout = Get.find<CheckoutController>();
  final controllerAddOrder = Get.find<AddOrderController>();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            const SizedBox(
              height: 60,
            ),
            CheckoutSteps(
              onTap: (index) { 
                if (controllerCheckout.orderEntity.payWithCash != null) {
                    pageController.animateToPage(
                    index,
                    duration: Duration(milliseconds: 300), 
                    curve: Curves.easeIn
                    );
                  } else {
                    showSnackBar(
                      'تنبيه !', 
                      'يرجى تحديد طريقة الدفع'
                      );
                  }
               },
              currentPageIndex: currentPageIndex, 
              pageController: pageController, 
              ),
            Expanded(
              child: CheckoutStepsPageView(
                valueListenable: valueNotifier,
                pageController: pageController,
                formKey: _formKey,
              ),
            ),
            CustomBottom(
                onPressed: () {
                  if (currentPageIndex == 0) {
                    handleShippingSectionValidation(context);
                  } else if (currentPageIndex == 1) {
                    handleAddressValidation();
                  } else {
                    // _processPayment(context);
                    var orderEntity = controllerCheckout.orderEntity;
                    controllerAddOrder.addOrder(order: orderEntity);

                  }
                  
                },
                text: getNextButtonText(currentPageIndex)),
            const SizedBox(
              height: 32,
            ),
          ],
        ),
      ),
    );
  }

  void handleShippingSectionValidation(BuildContext context) {
    if (controllerCheckout.orderEntity.payWithCash != null) {
      pageController.animateToPage(currentPageIndex + 1,
          duration: const Duration(milliseconds: 300), curve: Curves.bounceIn);
    } else {
      showSnackBar('تنبيه !', 'يرجي تحديد طريقه الدفع');
    }
  }
  
  String getNextButtonText(int currentPageIndex) {
    switch (currentPageIndex) {
      case 0:
        return 'التالي';
      case 1:
        return 'التالي';
      case 2:
        return 'الدفع عبر Stripe';
      default:
        return 'التالي';
    }
  }

  void handleAddressValidation() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      pageController.animateToPage(currentPageIndex + 1,
          duration: const Duration(milliseconds: 300), curve: Curves.bounceIn);
    } else {
      valueNotifier.value = AutovalidateMode.always;
    }
  }
}