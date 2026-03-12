import 'package:flutter/material.dart';
import 'package:fruits_hub/core/entities/product_entity.dart';
import 'package:fruits_hub/core/utils/app_images.dart';
import 'package:fruits_hub/features/home/presentation/controller/favorite_controller.dart';
import 'package:get/get.dart';
import 'package:svg_flutter/svg.dart';

class ProductImageSection extends StatelessWidget {
  const ProductImageSection({super.key, required this.product});
  final ProductEntity product;

  @override
  Widget build(BuildContext context) {
    final favoriteController = Get.find<FavoriteController>();
    final colors = Theme.of(context).colorScheme;

    return Stack(
      children: [ 
            CircleAvatar(
              child: SvgPicture.asset(Assets.imagesBackgroundImageProductsDetails),
            ),

          Center(
            child: product.imageUrl != null
                ? Image.network(product.imageUrl!, height: 160)
                : Image.asset('assets/images/watermelon.png', height: 160),
          ),

        // زر الرجوع
        PositionedDirectional(
          top: 12,
          start: 12,
          child: CircleAvatar(
            backgroundColor: colors.surface,
            child: IconButton(
              onPressed: (){
                Get.back();
              },
              icon: Icon(Icons.arrow_back, color: colors.onSurface),
              ),
          ),
        ),

        PositionedDirectional(
          top: 12,
          end: 12,
          child: Obx(() {
            final isFav = favoriteController.isFavorite(product);
            return Material(
              color: colors.surface.withValues(alpha: 0.95),
              // elevation: 2,
              borderRadius: BorderRadius.circular(999),
              child: InkWell(
                borderRadius: BorderRadius.circular(999),
                onTap: () => favoriteController.toggleFavorite(product),
                child: Padding(
                  padding: const EdgeInsets.all(8),
                  child: Icon(
                    isFav ? Icons.favorite : Icons.favorite_border,
                    color: isFav
                        ? Colors.red
                        : colors.onSurface.withValues(alpha: 0.6),
                    size: 22,
                  ),
                ),
              ),
            );
          }),
        ),
      ],
    );
  }
}
