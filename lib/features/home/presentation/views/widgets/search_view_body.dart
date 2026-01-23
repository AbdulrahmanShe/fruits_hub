import 'package:flutter/material.dart';
import 'package:fruits_hub/core/constants.dart';
import 'package:fruits_hub/core/controller/products_controller.dart';
import 'package:fruits_hub/core/widgets/custom_app_bar_notification.dart';
import 'package:fruits_hub/core/widgets/recent_search_list.dart';
import 'package:fruits_hub/core/widgets/search_results_grid.dart';
import 'package:fruits_hub/core/widgets/search_text_field.dart';
import 'package:get/get.dart';

class SearchViewBody extends StatelessWidget {
  const SearchViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<ProductsController>();
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Column(
              children: [
                const SizedBox(height: kTopPaddding),

                buildAppBarNotification(
                  title: 'البحث',
                  showBackBottom: true,
                ),

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
