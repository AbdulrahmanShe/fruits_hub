import 'package:flutter/material.dart';
import 'package:fruits_hub/core/controller/products_controller.dart';
import 'package:fruits_hub/generated/l10n.dart';
import 'package:fruits_hub/features/home/presentation/controller/favorite_controller.dart';
import 'package:fruits_hub/features/home/presentation/views/widgets/custom_error_widget.dart';
import 'package:fruits_hub/features/home/presentation/views/widgets/products_grid_view.dart';
import 'package:get/get.dart';

class FavoritProductsGridViewController extends StatelessWidget {
  const FavoritProductsGridViewController({super.key});

  @override
  Widget build(BuildContext context) {
    final favoriteController = Get.find<FavoriteController>();
    final productsController = Get.find<ProductsController>();

    return Obx(() {
      final favoriteProducts =
          productsController.products
              .where(
                (product) =>
                    favoriteController.favoriteIds.contains(product.productId),
              )
              .toList();

      if (favoriteProducts.isEmpty) {
        return SliverToBoxAdapter(
          child: CustomErrorWidget(text: S.of(context).favoritesEmpty),
        );
      }

      return ProductsGridView(products: favoriteProducts);
    });
  }
}
