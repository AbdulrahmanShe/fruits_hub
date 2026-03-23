class PaymentIntentInputModel {
  final String amount;
  final String currency;
  final String? customerId;

  PaymentIntentInputModel({
    required this.amount,
    required this.currency,
    this.customerId,
  });

  toJson() {
    final data = {
      'amount': '${amount}00',
      'currency': currency,
    };
    if (customerId != null && customerId!.isNotEmpty) {
      data['customer'] = customerId!;
    }
    return data;
  }


}
