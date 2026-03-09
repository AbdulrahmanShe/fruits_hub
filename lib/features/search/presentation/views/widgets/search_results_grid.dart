import 'package:flutter/material.dart';
import 'package:fruits_hub/core/utils/app_images.dart';
import 'package:fruits_hub/core/utils/app_text_styles.dart';
import 'package:fruits_hub/generated/l10n.dart';
import 'package:get/get.dart';
import 'package:fruits_hub/core/controller/products_controller.dart';
import 'package:fruits_hub/features/home/presentation/views/widgets/products_grid_view.dart';
import 'package:svg_flutter/svg.dart';
class SearchResultsGrid extends StatelessWidget {
  const SearchResultsGrid({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<ProductsController>();

    return Obx(() {
      final query = controller.searchQuery.value;
      final results = controller.filteredProducts;
      
      if (query.isEmpty && results.isEmpty) {
        return const SliverToBoxAdapter(child: SizedBox());
      }

      if (results.isEmpty) {
        return SliverToBoxAdapter(
          child: Center(
            child: Column(
              children: [
                SvgPicture.asset(Assets.imagesNoData),
                SizedBox(height: 16,),
                Text(
                  S.of(context).search,
                  style: TextStyles.bold16,
                  ),
                
                SizedBox(height: 16,),
                Text(
                  S.of(context).sorryDataUnavailableNow,
                  style: TextStyles.regular13.copyWith(
                    color: const Color(0xFF949D9E),
                  ),
                ),
              ],
            ),
          ),
        );
      }

      return ProductsGridView(
        products: controller.filteredProducts,
      );
    });
  }
}
