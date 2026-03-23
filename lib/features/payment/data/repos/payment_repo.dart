import 'package:dartz/dartz.dart';
import 'package:fruits_hub/core/errors/failures.dart';
import 'package:fruits_hub/features/payment/data/models/payment_intent_input_model.dart';

abstract class PaymentRepo {
  
Future <Either<Failure , void>> makePayment({
  required PaymentIntentInputModel paymentIntentInputModel
});
}