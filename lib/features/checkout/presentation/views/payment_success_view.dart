import 'package:flutter/material.dart';
import 'package:fruits_hub/core/utils/app_colors.dart';
import 'package:fruits_hub/core/utils/app_text_styles.dart';
import 'package:fruits_hub/core/widgets/custom_bottom.dart';
import 'package:fruits_hub/features/home/presentation/views/main_view.dart';
import 'package:fruits_hub/features/home/presentation/views/orders_view.dart';
import 'package:get/get.dart';

class PaymentSuccessView extends StatelessWidget {
  const PaymentSuccessView({super.key});
  static const routeName = '/paymentSuccessView';

  @override
  Widget build(BuildContext context) {
    final args = Get.arguments as Map<String, dynamic>?;
    final orderId = (args?['orderId'] ?? '--').toString();
    final amount = args?['amount'];
    final currency = (args?['currency'] ?? 'ILS').toString();
    final paymentMethod = (args?['paymentMethod'] ?? 'Stripe').toString();
    final status = (args?['status'] ?? 'بانتظار التأكيد').toString();

    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [AppColors.primaryColor, AppColors.lightPrimaryColor],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Stack(
          children: [
            Positioned(
              top: -60,
              right: -40,
              child: _GlowCircle(
                size: 180,
                color: AppColors.lightSecondaryColor.withOpacity(0.25),
              ),
            ),
            Positioned(
              bottom: -80,
              left: -50,
              child: _GlowCircle(
                size: 220,
                color: Colors.white.withOpacity(0.08),
              ),
            ),
            SafeArea(
              child: LayoutBuilder(
                builder: (context, constraints) {
                  return SingleChildScrollView(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: ConstrainedBox(
                      constraints: BoxConstraints(
                        minHeight: constraints.maxHeight,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const SizedBox(height: 24),
                          _SuccessBadge(),
                          const SizedBox(height: 24),
                          Text(
                            'تم الدفع بنجاح',
                            style: TextStyles.bold28.copyWith(
                              color: Colors.white,
                              height: 1.2,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(height: 8),
                          Text(
                            'تم تأكيد عملية الدفع عبر Stripe بنجاح',
                            style: TextStyles.regular16.copyWith(
                              color: Colors.white.withOpacity(0.9),
                            ),
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(height: 24),
                          _SummaryCard(
                            orderId: orderId,
                            amount: amount,
                            currency: currency,
                            paymentMethod: paymentMethod,
                            status: status,
                          ),
                          const SizedBox(height: 32),
                          CustomBottom(
                            onPressed: () {
                              Get.offAllNamed(OrdersView.routeName);
                            },
                            text: 'عرض الطلبات',
                          ),
                          const SizedBox(height: 12),
                          CustomBottom(
                            onPressed: () {
                              Get.offAllNamed(MainView.routeName, arguments: 0);
                            },
                            text: 'الرجوع للتسوق',
                          ),
                          const SizedBox(height: 24),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _SuccessBadge extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 120,
      height: 120,
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.12),
        shape: BoxShape.circle,
        border: Border.all(
          color: Colors.white.withOpacity(0.4),
          width: 2,
        ),
      ),
      child: const Center(
        child: Icon(
          Icons.check_circle,
          size: 70,
          color: Colors.white,
        ),
      ),
    );
  }
}

class _SummaryCard extends StatelessWidget {
  const _SummaryCard({
    required this.orderId,
    this.amount,
    required this.currency,
    required this.paymentMethod,
    required this.status,
  });

  final String orderId;
  final Object? amount;
  final String currency;
  final String paymentMethod;
  final String status;

  @override
  Widget build(BuildContext context) {
    final amountText = amount == null ? '--' : amount.toString();
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.12),
            blurRadius: 18,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Column(
        children: [
          Text(
            'تفاصيل العملية',
            style: TextStyles.bold19.copyWith(
              color: AppColors.primaryColor,
            ),
          ),
          const SizedBox(height: 12),
          _RowItem(
            label: 'رقم الطلب',
            value: orderId,
          ),
          const SizedBox(height: 8),
          _RowItem(
            label: 'المبلغ',
            value: '$amountText $currency',
          ),
          const SizedBox(height: 8),
          _RowItem(
            label: 'طريقة الدفع',
            value: paymentMethod,
          ),
          const SizedBox(height: 8),
          _RowItem(
            label: 'الحالة',
            value: status,
          ),
        ],
      ),
    );
  }
}

class _RowItem extends StatelessWidget {
  const _RowItem({required this.label, required this.value});

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Text(
            label,
            style: TextStyles.regular16.copyWith(
              color: Colors.black.withOpacity(0.6),
            ),
            overflow: TextOverflow.ellipsis,
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Text(
            value,
            textAlign: TextAlign.end,
            style: TextStyles.bold16.copyWith(
              color: Colors.black87,
            ),
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}

class _GlowCircle extends StatelessWidget {
  const _GlowCircle({required this.size, required this.color});

  final double size;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: color,
      ),
    );
  }
}
