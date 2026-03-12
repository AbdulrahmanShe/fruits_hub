import 'package:flutter/material.dart';
import 'package:fruits_hub/core/entities/product_entity.dart';
import 'package:fruits_hub/core/utils/app_text_styles.dart';
import 'package:fruits_hub/generated/l10n.dart';

class ProductProperties extends StatelessWidget {
  const ProductProperties({super.key, required this.product});
  final ProductEntity product;

  @override
  Widget build(BuildContext context) {
    return GridView(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 12,
        crossAxisSpacing: 12,
        childAspectRatio: 2.2,
      ),
      children: [
        PropertyItem(
          icon: Icons.eco,
          title: S.of(context).organic,
          value: product.isOrganic ? S.of(context).yes : S.of(context).no,
        ),
        PropertyItem(
          icon: Icons.calendar_today,
          title: S.of(context).expiry,
          value: S.of(context).monthsCount(product.expirationMonths.toString()),
        ),
        PropertyItem(
          icon: Icons.local_fire_department,
          title: S.of(context).calories,
          value: product.numberOfCalories.toString(),
        ),
        PropertyItem(
          icon: Icons.star,
          title: S.of(context).rating,
          value: product.avgRating.toString(),
        ),
      ],
    );
  }
}

class PropertyItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final String value;

  const PropertyItem({
    super.key,
    required this.icon,
    required this.title,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: colors.outline.withValues(alpha: 0.4)),
      ),
      child: Row(
        children: [
          Icon(icon, color: colors.primary),
          const SizedBox(width: 8),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                title,
                style: TextStyles.semiBold13.copyWith(color: colors.onSurface),
              ),
              Text(
                value,
                style: TextStyles.bold16.copyWith(color: colors.onSurface),
              ),
              
            ],
          ),
        ],
      ),
    );
  }
}
