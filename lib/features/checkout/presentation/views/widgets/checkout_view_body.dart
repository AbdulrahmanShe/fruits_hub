import 'package:flutter/material.dart';
import 'package:fruits_hub/core/utils/show_snack_bar.dart';
import 'package:fruits_hub/core/widgets/custom_bottom.dart';
import 'package:fruits_hub/features/checkout/presentation/controller/add_order_controller.dart';
import 'package:fruits_hub/features/checkout/presentation/controller/checkout_controller.dart';
import 'package:fruits_hub/features/checkout/presentation/views/widgets/checkout_steps.dart';
import 'package:fruits_hub/features/checkout/presentation/views/widgets/checkout_steps_page_view.dart';
import 'package:fruits_hub/features/checkout/presentation/views/payment_success_view.dart';
import 'package:fruits_hub/features/auth/presentation/views/sign_in_view.dart';
import 'package:fruits_hub/features/home/presentation/controller/cart_controller.dart';
import 'package:fruits_hub/features/payment/data/models/payment_intent_input_model.dart';
import 'package:fruits_hub/features/payment/data/repos/payment_repo_impl.dart';
import 'package:fruits_hub/features/payment/presentation/controller/payment_controller.dart';
import 'package:fruits_hub/generated/l10n.dart';
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
  late final PaymentController paymentController;


    @override
  void initState() {
    pageController = PageController();
    pageController.addListener(() {
      setState(() {
        currentPageIndex = pageController.page!.round();
      });
    });
    paymentController = Get.put(PaymentController(PaymentRepoImpl()));
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
  final cartController = Get.find<CartController>();


  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            const SizedBox(
              height: 60,
            ),
            CheckoutSteps(
              onTap: (index) { 
                // ⬅️ الرجوع للخلف دائمًا مسموح
  if (index < currentPageIndex) {
    pageController.animateToPage(
      index,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeIn,
    );
    return;
  }

                // ⬆️ الحركة للأمام
  if (currentPageIndex == 0) {
    handleShippingSectionValidation(context);
  } 
  else if (currentPageIndex == 1) {
    handleAddressValidation();
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
            Obx(() {
              final isLoading = paymentController.isLoading.value;
              final isOrderLoading = controllerAddOrder.isLoading.value;
              final payWithCash = controllerCheckout.orderEntity.payWithCash;
              final isStripeLoading = currentPageIndex == 2 &&
                  payWithCash == false &&
                  isLoading;
              final isCashLoading =
                  currentPageIndex == 2 && payWithCash == true && isOrderLoading;
              return CustomBottom(
                onPressed: () async {
                  if (currentPageIndex == 0) {
                    handleShippingSectionValidation(context);
                  } else if (currentPageIndex == 1) {
                    handleAddressValidation();
                  } else {
                    if (_redirectToSignInIfNeeded(context)) {
                      return;
                    }
                    if (payWithCash == true) {
                      var orderEntity = controllerCheckout.orderEntity;
                      final success =
                          await controllerAddOrder.addOrder(order: orderEntity);
                      if (success) {
                        final totalAmount = orderEntity
                            .calculateTotalPriceAfterDiscountAndShipping();
                        cartController.clearCart();
                        Get.toNamed(
                          PaymentSuccessView.routeName,
                          arguments: {
                            'orderId': orderEntity.orderId,
                            'amount': totalAmount,
                            'currency': 'ILS',
                            'paymentMethod': 'Cash',
                            'status': 'بانتظار التأكيد',
                          },
                        );
                      }
                    } else if (payWithCash == false) {
                      await _handleStripePayment(context);
                    } else {
                      showSnackBar(
                        S.of(context).alertExclamation,
                        S.of(context).pleaseSelectPaymentMethod,
                      );
                    }
                  }
                },
                text: getNextButtonText(currentPageIndex),
                isLoading: isStripeLoading || isCashLoading,
              );
            }),
            const SizedBox(
              height: 32,
            ),
          ],
        ),
    );
  }

  void handleShippingSectionValidation(BuildContext context) {
    if (controllerCheckout.orderEntity.payWithCash != null) {
      pageController.animateToPage(currentPageIndex + 1,
          duration: const Duration(milliseconds: 300), curve: Curves.bounceIn);
    } else {
      showSnackBar(S.of(context).alertExclamation, S.of(context).pleaseSelectPaymentMethod);
    }
  }
  
  String getNextButtonText(int currentPageIndex) {
    switch (currentPageIndex) {
      case 0:
        return S.of(context).next;
      case 1:
        return S.of(context).next;
      case 2:
        final payWithCash = controllerCheckout.orderEntity.payWithCash;
        if (payWithCash == true) {
          return S.of(context).confirmOrder;
        }
        return S.of(context).payWithStripe;
      default:
        return S.of(context).next;
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

  Future<void> _handleStripePayment(BuildContext context) async {
    if (paymentController.isLoading.value) {
      return;
    }
    try {
      if (_redirectToSignInIfNeeded(context)) {
        return;
      }
      final total = controllerCheckout.orderEntity
          .calculateTotalPriceAfterDiscountAndShipping();
      if (total.isNaN || total.isInfinite || total <= 0) {
        showSnackBar(
          S.of(context).alertExclamation,
          S.of(context).pleaseSelectPaymentMethod,
        );
        return;
      }
      final paymentIntentInputModel = PaymentIntentInputModel(
        amount: total.toStringAsFixed(0),
        currency: 'ils',
      );
      await paymentController.makePayment(
        paymentIntentInputModel: paymentIntentInputModel,
      );
      if (paymentController.isSuccess.value) {
        final success = await controllerAddOrder.addOrder(
          order: controllerCheckout.orderEntity,
        );
        paymentController.isSuccess.value = false;
        if (success) {
          final totalAmount = total;
          cartController.clearCart();
          Get.toNamed(
            PaymentSuccessView.routeName,
            arguments: {
              'orderId': controllerCheckout.orderEntity.orderId,
              'amount': totalAmount,
              'currency': 'ILS',
              'paymentMethod': 'Stripe',
              'status': 'تم الاستلام',
            },
          );
        }
      } else if (paymentController.errorMessage.isNotEmpty) {
        showSnackBar(
          S.of(context).failed,
          paymentController.errorMessage.value,
        );
        paymentController.errorMessage.value = '';
      }
    } catch (e) {
      showSnackBar(S.of(context).failed, e.toString());
    }
  }

  bool _redirectToSignInIfNeeded(BuildContext context) {
    final userId = controllerCheckout.orderEntity.uID;
    if (userId.isNotEmpty) {
      return false;
    }
    showSnackBar(
      S.of(context).alertExclamation,
      S.of(context).alreadyRegisteredPleaseSignIn,
    );
    Get.offAllNamed(SignInView.routeName);
    return true;
  }
}
