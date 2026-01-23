import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:fruits_hub/core/controller/products_controller.dart';
import 'package:fruits_hub/features/home/presentation/views/widgets/custom_error_widget.dart';
import 'package:fruits_hub/features/home/presentation/views/widgets/products_grid_view.dart';
class SearchResultsGrid extends StatelessWidget {
  const SearchResultsGrid({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<ProductsController>();

    return Obx(() {
      if (controller.searchQuery.isEmpty) {
        return const SliverToBoxAdapter(child: SizedBox());
      }

      if (controller.filteredProducts.isEmpty) {
        return const SliverToBoxAdapter(
          child: CustomErrorWidget(
            text: 'لا توجد نتائج',
          ),
        );
      }

      return ProductsGridView(
        products: controller.filteredProducts,
      );
    });
  }
}
