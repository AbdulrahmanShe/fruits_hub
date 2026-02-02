import 'package:flutter/material.dart';
import 'package:fruits_hub/core/entities/product_entity.dart';
import 'package:fruits_hub/core/utils/app_text_styles.dart';

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
          title: 'اوجانيك',
          value: product.isOrganic ? 'نعم' : 'لا',
        ),
        PropertyItem(
          icon: Icons.calendar_today,
          title: 'الصلاحية',
          value: '${product.expirationMonths} أشهر',
        ),
        PropertyItem(
          icon: Icons.local_fire_department,
          title: 'سعرات',
          value: product.numberOfCalories.toString(),
        ),
        PropertyItem(
          icon: Icons.star,
          title: 'التقييم',
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
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Row(
        children: [
          Icon(icon, color: Colors.green),
          const SizedBox(width: 8),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(title, style: TextStyles.semiBold13),
              Text(value, style: TextStyles.bold16),
              
            ],
          ),
        ],
      ),
    );
  }
}
