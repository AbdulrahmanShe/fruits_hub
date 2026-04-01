import 'package:flutter/material.dart';
import 'package:fruits_hub/core/utils/app_text_styles.dart';
import 'package:fruits_hub/core/widgets/custom_app_bar.dart';
import 'package:fruits_hub/generated/l10n.dart';

class AboutUsView extends StatelessWidget {
  const AboutUsView({super.key});

  static const routeName = '/aboutUsView';

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return Scaffold(
      appBar: buildAppBar(context, title: S.of(context).aboutUs),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(16, 16, 16, 24),
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: colors.primary.withValues(alpha: 0.12),
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: colors.outline.withValues(alpha: 0.4)),
            ),
            child: Row(
              children: [
                Container(
                  width: 46,
                  height: 46,
                  decoration: BoxDecoration(
                    color: colors.primary,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Icon(
                    Icons.eco_outlined,
                    color: Colors.white,
                    size: 24,
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('SallaMarket', style: TextStyles.bold16),
                      const SizedBox(height: 2),
                      Text(
                        S.of(context).easierFreshFruitShoppingExperience,
                        style: TextStyles.regular13.copyWith(
                          color: colors.onSurface.withValues(alpha: 0.7),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 18),
          _SectionCard(
            title: S.of(context).ourMission,
            icon: Icons.flag_outlined,
            body:
                '${S.of(context).weBelieveFreshProductsShouldBeSimpleAndFast} ${S.of(context).designedClearPurchaseExperience}',
          ),
          const SizedBox(height: 12),
          _SectionCard(
            title: S.of(context).whatWeCommitTo,
            icon: Icons.verified_outlined,
            body:
                '${S.of(context).weWorkWithTrustedSuppliers} ${S.of(context).weFocusOnTransparentPricing}',
          ),
          const SizedBox(height: 12),
          _SectionCard(
            title: S.of(context).whyFruitHub,
            icon: Icons.lightbulb_outline,
            body:
                S.of(context).weContinuouslyImproveApp,
          ),
          const SizedBox(height: 12),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: [
              _InfoChip(text: S.of(context).guaranteedQuality),
              _InfoChip(text: S.of(context).fastDelivery),
              _InfoChip(text: S.of(context).securePayment),
              _InfoChip(text: S.of(context).continuousUpdates),
            ],
          ),
          const SizedBox(height: 14),
          Text(
            S.of(context).thanksForTrustingFruitHub,
            textAlign: TextAlign.center,
            style: TextStyles.semiBold13.copyWith(
              color: colors.primary,
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
    final colors = Theme.of(context).colorScheme;
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: colors.surface,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: colors.outline.withValues(alpha: 0.35)),
        boxShadow: [
          BoxShadow(
            color: colors.shadow.withValues(alpha: 0.06),
            blurRadius: 12,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 28,
                height: 28,
                decoration: BoxDecoration(
                  color: colors.primary.withValues(alpha: 0.12),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Icon(icon, size: 16, color: colors.primary),
              ),
              const SizedBox(width: 6),
              Text(
                title,
                style: TextStyles.bold13.copyWith(color: colors.onSurface),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            body,
            style: TextStyles.regular13.copyWith(
              color: colors.onSurface.withValues(alpha: 0.7),
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
    final colors = Theme.of(context).colorScheme;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
      decoration: BoxDecoration(
        color: colors.surface,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: colors.outline.withValues(alpha: 0.4)),
      ),
      child: Text(
        text,
        style: TextStyles.regular13.copyWith(
          color: colors.onSurface.withValues(alpha: 0.7),
        ),
      ),
    );
  }
}
