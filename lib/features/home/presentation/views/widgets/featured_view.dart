import 'package:flutter/material.dart';
import 'package:fruits_hub/core/controller/products_controller.dart';
import 'package:fruits_hub/core/widgets/custom_app_bar.dart';
import 'package:fruits_hub/generated/l10n.dart';
import 'package:fruits_hub/features/home/presentation/views/widgets/products_grid_view.dart';
import 'package:get/get.dart';

class FeaturedView extends StatefulWidget {
  const FeaturedView({super.key});
  static const routeName = "/featuredView";

  @override
  State<FeaturedView> createState() => _FeaturedViewState();
}

class _FeaturedViewState extends State<FeaturedView> {
  final ProductsController controller = Get.find<ProductsController>();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      controller.getFeaturedProducts();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context, title: S.of(context).featuredProducts),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Obx(() {
          return CustomScrollView(
            slivers: [
              const SliverToBoxAdapter(
                child: SizedBox(height: 12),
              ),
            ProductsGridView(products: controller.displayProducts),
           ],
          );
        }),
      ),
    );
  }
}
