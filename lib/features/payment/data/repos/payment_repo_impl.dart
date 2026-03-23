import 'package:dartz/dartz.dart';
import 'package:fruits_hub/core/errors/failures.dart';
import 'package:fruits_hub/core/utils/stripe_service.dart';
import 'package:fruits_hub/features/payment/data/models/payment_intent_input_model.dart';
import 'package:fruits_hub/features/payment/data/repos/payment_repo.dart';

class PaymentRepoImpl extends PaymentRepo{
  final StripeService stripeService = StripeService();

  @override
  Future<Either<Failure, void>> makePayment({required PaymentIntentInputModel paymentIntentInputModel}) async{
    try {

  await stripeService.makePayment(paymentIntentInputModel: paymentIntentInputModel);
  
  return right(null);

} catch (e) {
  return left(ServerFailure(e.toString()));
}
  }
}