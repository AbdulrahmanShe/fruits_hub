import 'package:flutter/material.dart';
import 'package:fruits_hub/core/controller/products_controller.dart';
import 'package:fruits_hub/features/home/presentation/views/widgets/custom_error_widget.dart';
import 'package:fruits_hub/features/home/presentation/views/widgets/products_grid_view.dart';
import 'package:get/get.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:fruits_hub/core/helper_functions/get_dummy_product.dart';

class ProductsGridViewController extends StatelessWidget {
  const ProductsGridViewController({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final ProductsController controller = Get.find<ProductsController>();

    return Obx((){
      /// Success
      if (!controller.isLoading.value &&
          controller.errorMessage.isEmpty &&
          controller.products.isNotEmpty) {
        return ProductsGridView(products: controller.products,);
      }
      /// Failure
      if (!controller.isLoading.value &&
          controller.errorMessage.isNotEmpty) {
        return SliverToBoxAdapter(
          child: CustomErrorWidget(
            text: controller.errorMessage.value,
          ),
        );
      }

      /// Loading
      return Skeletonizer.sliver(
        enabled: true,
        child: ProductsGridView(
          products: getDummyProducts(),
        ),
      );
    });
    // return ProductsGridView();
  }
}