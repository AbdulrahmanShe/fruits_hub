import 'package:flutter/material.dart';
import 'package:fruits_hub/core/entities/product_entity.dart';
import 'package:fruits_hub/core/utils/app_text_styles.dart';
import 'package:fruits_hub/generated/l10n.dart';
import 'package:fruits_hub/features/home/presentation/views/widgets/add_to_cart_section.dart';
import 'package:fruits_hub/features/home/presentation/views/widgets/product_properties.dart';

class ProductDetailsContent extends StatelessWidget {
  const ProductDetailsContent({super.key, required this.product});
  final ProductEntity product;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          
          // الاسم + السعر
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
               Text(
                product.name,
                style: TextStyles.bold16.copyWith(color: colors.onSurface),
              ),
              
              Text(
                S.of(context).shekelPerKilo(product.price.toString()),
                style: TextStyles.semiBold13.copyWith(color: colors.primary),
              ),
               
            ],
          ),          

              const SizedBox(height: 8),

          // التقييم
          Row(
            children: [
              Icon(Icons.star, color: colors.secondary, size: 18),
              SizedBox(width: 4),
              Text(
                '${product.avgRating} (${product.ratingCount})',
                style: TextStyles.regular13.copyWith(color: colors.onSurface),
              ),
            ],
          ),

          const SizedBox(height: 16),

          // الوصف
           Text(
           product.description,
            style: TextStyles.regular13.copyWith(
              color: colors.onSurface.withValues(alpha: 0.6),
          ),
           ),

          const SizedBox(height: 24),

          // الخصائص
           ProductProperties(product: product),

          // const Spacer(),
          const SizedBox(height: 24),
          // // زر السلة

           AddToCartSection(product: product,),
          // const SizedBox(height: 24),
        ],
      ),
    );
  }
}
