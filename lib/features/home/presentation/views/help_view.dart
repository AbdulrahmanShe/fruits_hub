import 'package:flutter/material.dart';
import 'package:fruits_hub/core/utils/app_colors.dart';
import 'package:fruits_hub/core/utils/app_text_styles.dart';
import 'package:fruits_hub/core/widgets/custom_app_bar_notification.dart';

class HelpView extends StatelessWidget {
  const HelpView({super.key});

  static const routeName = '/helpView';

  @override
  Widget build(BuildContext context) {
    final faqs = <_FaqItem>[
      const _FaqItem(
        question: 'كيف أتابع حالة طلبي؟',
        answer:
            'من صفحة "طلباتي" افتح الطلب المطلوب وستجد تفاصيل الطلب والفاتورة.',
      ),
      const _FaqItem(
        question: 'كيف أضيف منتج للمفضلة؟',
        answer:
            'اضغط على أيقونة القلب داخل بطاقة المنتج، وسيظهر المنتج مباشرة في صفحة المفضلة.',
      ),
      const _FaqItem(
        question: 'كيف أغير اللغة؟',
        answer:
            'من "حسابي" ثم "اللغة"، اختر العربية أو الإنجليزية وسيتم تطبيقها فورًا.',
      ),
      const _FaqItem(
        question: 'ماذا أفعل إذا واجهت مشكلة في الدفع؟',
        answer:
            'تأكد من الاتصال بالإنترنت ومن صلاحية البطاقة، ثم أعد المحاولة أو تواصل مع الدعم.',
      ),
    ];

    return Scaffold(
      appBar: buildAppBarNotification(
        title: 'المساعدة',
        showNotification: false,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: const Color(0xFFF3F7F4),
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: const Color(0xFFE1E8E3)),
            ),
            child: Row(
              children: [
                const Icon(Icons.support_agent, color: AppColors.primaryColor),
                const SizedBox(width: 10),
                Expanded(
                  child: Text(
                    'كيف نقدر نساعدك اليوم؟',
                    style: TextStyles.bold13,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 12),
          ...faqs.map((faq) => _FaqTile(item: faq)),
          const SizedBox(height: 12),
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: const Color(0xFFE6E9E9)),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('التواصل مع الدعم', style: TextStyles.bold13),
                const SizedBox(height: 8),
                _ContactRow(
                  icon: Icons.email_outlined,
                  text: 'support@fruithub.app',
                ),
                const SizedBox(height: 6),
                _ContactRow(
                  icon: Icons.call_outlined,
                  text: '+970 59 000 0000',
                ),
                const SizedBox(height: 6),
                _ContactRow(
                  icon: Icons.schedule,
                  text: 'من 9:00 صباحًا حتى 10:00 مساءً',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _FaqTile extends StatelessWidget {
  const _FaqTile({required this.item});

  final _FaqItem item;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: const Color(0xFFE6E9E9)),
      ),
      child: ExpansionTile(
        tilePadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
        childrenPadding: const EdgeInsets.fromLTRB(12, 0, 12, 12),
        title: Text(item.question, style: TextStyles.semiBold13),
        children: [
          Align(
            alignment: Alignment.centerRight,
            child: Text(
              item.answer,
              style: TextStyles.regular13.copyWith(
                color: const Color(0xFF5E6966),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _ContactRow extends StatelessWidget {
  const _ContactRow({required this.icon, required this.text});

  final IconData icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, size: 18, color: const Color(0xFF6B7572)),
        const SizedBox(width: 8),
        Expanded(
          child: Text(
            text,
            style: TextStyles.regular13.copyWith(
              color: const Color(0xFF5E6966),
            ),
          ),
        ),
      ],
    );
  }
}

class _FaqItem {
  const _FaqItem({required this.question, required this.answer});

  final String question;
  final String answer;
}
