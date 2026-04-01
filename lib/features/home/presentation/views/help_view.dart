import 'package:flutter/material.dart';
import 'package:fruits_hub/core/utils/app_text_styles.dart';
import 'package:fruits_hub/core/widgets/custom_app_bar.dart';
import 'package:fruits_hub/generated/l10n.dart';

class HelpView extends StatelessWidget {
  const HelpView({super.key});

  static const routeName = '/helpView';

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final faqs = <_FaqItem>[
      _FaqItem(
        question: S.of(context).howTrackOrderStatus,
        answer: S.of(context).fromMyOrdersOpenOrder,
      ),
      _FaqItem(
        question: S.of(context).howAddProductToFavorites,
        answer: S.of(context).tapHeartIconInProductCard,
      ),
      _FaqItem(
        question: S.of(context).howChangeLanguage,
        answer: S.of(context).fromMyAccountThenLanguage,
      ),
      _FaqItem(
        question: S.of(context).whatIfPaymentIssue,
        answer: S.of(context).checkInternetAndCardThenRetry,
      ),
    ];

    return Scaffold(
      appBar: buildAppBar(
        context,
        title: S.of(context).help,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: colors.primary.withValues(alpha: 0.12),
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: colors.outline.withValues(alpha: 0.4)),
            ),
            child: Row(
              children: [
                Icon(Icons.support_agent, color: colors.primary),
                const SizedBox(width: 10),
                Expanded(
                  child: Text(
                    S.of(context).howCanWeHelpToday,
                    style: TextStyles.bold13.copyWith(color: colors.onSurface),
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
              color: colors.surface,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: colors.outline.withValues(alpha: 0.4)),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  S.of(context).contactSupport,
                  style: TextStyles.bold13.copyWith(color: colors.onSurface),
                ),
                const SizedBox(height: 8),
                _ContactRow(
                  icon: Icons.email_outlined,
                  text: 'support@sallamaket.app',
                ),
                const SizedBox(height: 6),
                _ContactRow(
                  icon: Icons.call_outlined,
                  text: '7844 980 059',
                ),
                const SizedBox(height: 6),
                _ContactRow(
                  icon: Icons.schedule,
                  text: S.of(context).supportHours,
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
    final colors = Theme.of(context).colorScheme;
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      decoration: BoxDecoration(
        color: colors.surface,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: colors.outline.withValues(alpha: 0.4)),
      ),
      child: ExpansionTile(
        tilePadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
        childrenPadding: const EdgeInsets.fromLTRB(12, 0, 12, 12),
        title: Text(
          item.question,
          style: TextStyles.semiBold13.copyWith(color: colors.onSurface),
        ),
        children: [
          Align(
            alignment: Alignment.centerRight,
            child: Text(
              item.answer,
              style: TextStyles.regular13.copyWith(
                color: colors.onSurface.withValues(alpha: 0.7),
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
    final colors = Theme.of(context).colorScheme;
    return Row(
      children: [
        Icon(icon, size: 18, color: colors.onSurface.withValues(alpha: 0.6)),
        const SizedBox(width: 8),
        Expanded(
          child: Text(
            text,
            style: TextStyles.regular13.copyWith(
              color: colors.onSurface.withValues(alpha: 0.7),
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
