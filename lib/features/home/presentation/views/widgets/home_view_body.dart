import 'package:flutter/material.dart';
import 'package:fruits_hub/core/constants.dart';
import 'package:fruits_hub/core/controller/products_controller.dart';
import 'package:fruits_hub/core/widgets/search_text_field.dart';
import 'package:fruits_hub/features/home/presentation/views/widgets/best_selling_header.dart';
import 'package:fruits_hub/features/home/presentation/views/widgets/custom_home_app_bar.dart';
import 'package:fruits_hub/features/home/presentation/views/widgets/featured_list.dart';
import 'package:fruits_hub/features/home/presentation/views/widgets/products_grid_view_controller.dart';
import 'package:get/get.dart';

class HomeViewBody extends StatefulWidget {
  const HomeViewBody({
    super.key,
  });

  @override
  State<HomeViewBody> createState() => _HomeViewBodyState();
}

class _HomeViewBodyState extends State<HomeViewBody> {
  final ProductsController controller = Get.find<ProductsController>();
  
  @override
  void initState() {
    super.initState();
    controller.getBestSellingProducts();
  }
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: const CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Column(
              children: [
                SizedBox(height: kTopPaddding,),
                CustomHomeAppBar(),
                SizedBox(height: 16,),
                SearchTextField(),
                SizedBox(height: 12,),
                FeaturedList(),
                SizedBox(height: 12,),
                BestSellingHeader(),
                SizedBox(height: 12,),
                
                
              ],
            ),
          ),
          ProductsGridViewController(),
        ],
      ),
    );
  }
}

