import 'package:flutter/material.dart';
import 'package:fruits_hub/core/utils/app_colors.dart';
import 'package:fruits_hub/core/utils/app_text_styles.dart';
import 'package:fruits_hub/core/widgets/custom_app_bar_notification.dart';

class AboutUsView extends StatelessWidget {
  const AboutUsView({super.key});

  static const routeName = '/aboutUsView';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBarNotification(title: 'من نحن', showNotification: false),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Container(
            padding: const EdgeInsets.all(14),
            decoration: BoxDecoration(
              color: const Color(0xFFF1F7F3),
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: const Color(0xFFDFECE4)),
            ),
            child: Row(
              children: [
                Container(
                  width: 42,
                  height: 42,
                  decoration: BoxDecoration(
                    color: AppColors.primaryColor,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Icon(
                    Icons.eco_outlined,
                    color: Colors.white,
                    size: 22,
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('FruitHub', style: TextStyles.bold16),
                      const SizedBox(height: 2),
                      Text(
                        'تجربة أسهل لشراء الفواكه الطازجة',
                        style: TextStyles.regular13.copyWith(
                          color: const Color(0xFF57615E),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 14),
          _SectionCard(
            title: 'رسالتنا',
            icon: Icons.flag_outlined,
            body:
                'نؤمن أن الوصول إلى منتجات طازجة بجودة عالية يجب أن يكون بسيطًا وسريعًا لكل بيت. '
                'لهذا صممنا تجربة شراء واضحة من اختيار المنتج حتى استلام الطلب.',
          ),
          const SizedBox(height: 10),
          _SectionCard(
            title: 'ما نلتزم به',
            icon: Icons.verified_outlined,
            body:
                'نعمل مع موردين موثوقين ونراجع جودة الطلبات قبل الشحن. '
                'نركز على وضوح الأسعار، سهولة الدفع، وسلاسة التتبع.',
          ),
          const SizedBox(height: 10),
          _SectionCard(
            title: 'لماذا FruitHub؟',
            icon: Icons.lightbulb_outline,
            body:
                'نطوّر التطبيق باستمرار بناءً على ملاحظاتكم ونضيف مزايا جديدة لتحسين تجربة التسوق يومًا بعد يوم.',
          ),
          const SizedBox(height: 12),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: const [
              _InfoChip(text: 'جودة مضمونة'),
              _InfoChip(text: 'توصيل سريع'),
              _InfoChip(text: 'دفع آمن'),
              _InfoChip(text: 'تحديث مستمر'),
            ],
          ),
          const SizedBox(height: 14),
          Text(
            'شكرًا لثقتك بـ FruitHub',
            textAlign: TextAlign.center,
            style: TextStyles.semiBold13.copyWith(
              color: AppColors.primaryColor,
            ),
          ),
        ],
      ),
    );
  }
}

class _SectionCard extends StatelessWidget {
  const _SectionCard({
    required this.title,
    required this.icon,
    required this.body,
  });

  final String title;
  final IconData icon;
  final String body;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: const Color(0xFFE6E9E9)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(icon, size: 18, color: AppColors.primaryColor),
              const SizedBox(width: 6),
              Text(title, style: TextStyles.bold13),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            body,
            style: TextStyles.regular13.copyWith(
              color: const Color(0xFF56605D),
              height: 1.8,
            ),
          ),
        ],
      ),
    );
  }
}

class _InfoChip extends StatelessWidget {
  const _InfoChip({required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
      decoration: BoxDecoration(
        color: const Color(0xFFF7F9F8),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: const Color(0xFFE2E6E5)),
      ),
      child: Text(
        text,
        style: TextStyles.regular13.copyWith(color: const Color(0xFF4E5754)),
      ),
    );
  }
}
