import 'package:flutter/material.dart';
import 'package:fruits_hub/core/entities/product_entity.dart';
import 'package:fruits_hub/core/utils/app_colors.dart';
import 'package:fruits_hub/core/utils/app_images.dart';
import 'package:fruits_hub/core/utils/app_text_styles.dart';
import 'package:fruits_hub/core/widgets/custom_network_image.dart';
import 'package:fruits_hub/features/home/presentation/controller/cart_controller.dart';
import 'package:fruits_hub/features/home/presentation/controller/favorite_controller.dart';
import 'package:get/get.dart';

class FruitItem extends StatelessWidget {
  const FruitItem({super.key, required this.productEntity});

  final ProductEntity productEntity;

  @override
  Widget build(BuildContext context) {
    final FavoriteController favoriteController =
        Get.find<FavoriteController>();

    return Container(
      decoration: ShapeDecoration(
        color: const Color(0xFFF3F5F7),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4),
        ),
      ),
      child: Stack(
        children: [
          /// ❤️ Favorite Icon
          Positioned(
            top: 4,
            right: 4,
            child: Obx(() {
              final isFav =
                  favoriteController.isFavorite(productEntity);

              return IconButton(
                icon: Icon(
                  isFav ? Icons.favorite : Icons.favorite_border,
                  color: isFav ? Colors.red : Colors.grey,
                ),
                onPressed: () {
                  favoriteController.toggleFavorite(productEntity);
                },
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
                    '${productEntity.price} جنيه / كيلو',
                    textAlign: TextAlign.right,
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
    );
  }
}
