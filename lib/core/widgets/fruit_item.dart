import 'package:flutter/material.dart';
import 'package:fruits_hub/core/entities/product_entity.dart';
import 'package:fruits_hub/core/utils/app_colors.dart';
import 'package:fruits_hub/core/utils/app_images.dart';
import 'package:fruits_hub/core/utils/app_text_styles.dart';
import 'package:fruits_hub/core/widgets/custom_network_image.dart';
import 'package:fruits_hub/generated/l10n.dart';
import 'package:fruits_hub/features/home/presentation/controller/cart_controller.dart';
import 'package:fruits_hub/features/home/presentation/controller/favorite_controller.dart';
import 'package:fruits_hub/features/home/presentation/views/widgets/product_details_view.dart';
import 'package:get/get.dart';

class FruitItem extends StatelessWidget {
  const FruitItem({super.key, required this.productEntity});

  final ProductEntity productEntity;

  @override
  Widget build(BuildContext context) {
    final FavoriteController favoriteController =
        Get.find<FavoriteController>();
    final theme = Theme.of(context);
    final colors = theme.colorScheme;

    return GestureDetector(
      onTap: () {
    Get.toNamed(
      ProductDetailsView.routeName,
      arguments: productEntity,
    );
  },
      child: Container(
        decoration: ShapeDecoration(
          color: theme.cardColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(4),
          ),
        ),
        child: Stack(
          children: [
            /// ❤️ Favorite Icon
            PositionedDirectional(
              top: 4,
              start: 4,
              child: Obx(() {
                final isFav = favoriteController.isFavorite(productEntity);
      
                return Material(
                  color: colors.surface.withValues(alpha: 0.9),
                  // elevation: 2,
                  borderRadius: BorderRadius.circular(999),
                  child: InkWell(
                    borderRadius: BorderRadius.circular(999),
                    onTap: () {
                      favoriteController.toggleFavorite(productEntity);
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(6),
                      child: Icon(
                        isFav ? Icons.favorite : Icons.favorite_border,
                        color: isFav
                            ? Colors.red
                            : colors.onSurface.withValues(alpha: 0.6),
                        size: 20,
                      ),
                    ),
                  ),
                );
              }),
            ),
      
            /// 🧺 Product Content
            Positioned.fill(
              child: Column(
                children: [
                  const SizedBox(height: 20),
      
                  productEntity.imageUrl != null
                      ? Flexible(
                          child: CustomNetworkImage(
                            imageUrl: productEntity.imageUrl!,
                          ),
                        )
                      : Image.asset(Assets.imagesWatermelonTest),
      
                  const SizedBox(height: 24),
      
                  ListTile(
                    title: Text(
                      productEntity.name,
                      textAlign: TextAlign.right,
                      style: TextStyles.semiBold16,
                    ),
                    subtitle: Text(
                      S.of(context).shekelPerKilo(productEntity.price.toString()),
                      textAlign: TextAlign.right,
                      style: TextStyles.semiBold13.copyWith(color: colors.primary),
                    ),
                    trailing: GestureDetector(
                      onTap: () {
                        Get.find<CartController>()
                            .addProduct(productEntity);
                      },
                      child: const CircleAvatar(
                        backgroundColor: AppColors.primaryColor,
                        child: Icon(Icons.add, color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
