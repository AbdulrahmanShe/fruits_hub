import 'package:flutter/material.dart';
import 'package:fruits_hub/core/constants.dart';
import 'package:fruits_hub/core/controller/products_controller.dart';
import 'package:fruits_hub/core/widgets/custom_app_bar_notification.dart';
import 'package:fruits_hub/features/home/presentation/views/widgets/categories_section.dart';
import 'package:fruits_hub/features/search/presentation/views/widgets/search_text_field.dart';
import 'package:fruits_hub/features/home/presentation/views/widgets/products_grid_view_controller.dart';
import 'package:fruits_hub/features/home/presentation/views/widgets/products_view_header.dart';
import 'package:get/get.dart';

class ProductsViewBody extends StatefulWidget {
  const ProductsViewBody({super.key});

  @override
  State<ProductsViewBody> createState() => _ProductsViewBodyState();
}

class _ProductsViewBodyState extends State<ProductsViewBody> {
  final ProductsController controller = Get.find<ProductsController>();
  
  @override
  void initState() {
    super.initState();
    controller.getProducts();
  }
  
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Column(
              children: [
                const SizedBox(
                  height: kTopPaddding,
                ),
                buildAppBarNotification( 
                  title: 'المنتجات',
                  showBackBottom: false,
                ),
                const SizedBox(
                  height: 16,
                ),
                 SearchTextField(readOnly: true,),
                const SizedBox(
                  height: 12,
                ),
                const CategoriesSection(),
                const SizedBox(
                  height: 12,
                ),
                Obx(() => ProductsViewHeader(
                        productsLength: controller.displayProducts.length,
                  ),
                  ),
                const SizedBox(
                  height: 8,
                ),
              ],
            ),
          ),
          const ProductsGridViewController(),
        ],
      ),
    );
  }
}