import 'dart:developer';
import 'package:fruits_hub/features/payment/data/models/payment_intent_input_model.dart';
import 'package:fruits_hub/features/payment/data/repos/payment_repo.dart';
import 'package:get/get.dart';

class PaymentController extends GetxController{
  final PaymentRepo paymentRepo;

  PaymentController(this.paymentRepo);

  var isLoading = false.obs;
  var isSuccess = false.obs;
  var errorMessage = ''.obs;

  Future<void> makePayment({required PaymentIntentInputModel paymentIntentInputModel})async {

    isLoading.value = true;
    errorMessage.value = "";
    isSuccess.value = false;

   var data = await paymentRepo.makePayment(paymentIntentInputModel: paymentIntentInputModel);
   data.fold(
    (l) {
        errorMessage.value = l.message;
        isSuccess.value = false;
      }, 
    (r) => isSuccess.value = true,

    );
     isLoading.value = false;
     log("""
    PaymentController state changed:
    isLoading: ${isLoading.value}
    isSuccess: ${isSuccess.value}
    errorMessage: ${errorMessage.value}
    """);
  }
}