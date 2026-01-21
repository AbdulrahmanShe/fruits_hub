import 'package:flutter/material.dart';
import 'package:fruits_hub/core/constants.dart';
import 'package:fruits_hub/core/widgets/custom_app_bar_notification.dart';
import 'package:fruits_hub/core/widgets/search_text_field.dart';
import 'package:fruits_hub/features/home/presentation/controller/favorite_controller.dart';
import 'package:fruits_hub/features/home/presentation/views/widgets/favorit_products_grid_view_controller.dart';
import 'package:fruits_hub/features/home/presentation/views/widgets/products_view_header.dart';
import 'package:get/get.dart';

class FavoritViewBody extends StatelessWidget {
  const FavoritViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    final FavoriteController controller = Get.find<FavoriteController>();

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Column(
              children: [
                const SizedBox(height: kTopPaddding),
                buildAppBarNotification(
                  title: 'المفضلة',
                  showBackBottom: false,
                ),
                const SizedBox(height: 16),
                const SearchTextField(),
                const SizedBox(height: 12),

                /// عرض عدد المنتجات المفضلة
                Obx(() {
                  return ProductsViewHeader(
                    productsLength: controller.favoritesCodes.length,
                  );
                }),

                const SizedBox(height: 8),
              ],
            ),
          ),

          /// GridView للمنتجات المفضلة
          const FavoritProductsGridViewController(),
        ],
      ),
    );
  }
}
