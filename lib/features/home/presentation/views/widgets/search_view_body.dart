import 'package:flutter/material.dart';
import 'package:fruits_hub/core/constants.dart';
import 'package:fruits_hub/core/controller/products_controller.dart';
import 'package:fruits_hub/core/widgets/custom_app_bar_search.dart';
import 'package:fruits_hub/core/widgets/recent_search_list.dart';
import 'package:fruits_hub/core/widgets/search_results_grid.dart';
import 'package:fruits_hub/core/widgets/search_text_field.dart';
import 'package:get/get.dart';

class SearchViewBody extends StatefulWidget {
  const SearchViewBody({super.key});

  @override
  State<SearchViewBody> createState() => _SearchViewBodyState();
}

class _SearchViewBodyState extends State<SearchViewBody> {
  final controller = Get.find<ProductsController>();

  @override
  void initState() {
    super.initState();
    controller.clearSearch();        // 🔥 هذا هو السر
  }

  @override
  void dispose() {
    controller.clearSearch();        // (اختياري)
    super.dispose();
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
                const SizedBox(height: kTopPaddding),

                buildAppBarSearch(title:  'البحث'),

                const SizedBox(height: 16),
                 SearchTextField(),
                const SizedBox(height: 16),

                  /// ✅ Recent Searches (تظهر فقط إذا ما في نص بحث)
                Obx(() {
                  if (controller.searchQuery.isEmpty) {
                    return const RecentSearchList();
                  }
                  return const SizedBox.shrink();
                }),
              ],
            ),
          ),

          /// نتائج البحث
          const SearchResultsGrid(),
        ],
      ),
    );
  }
}
