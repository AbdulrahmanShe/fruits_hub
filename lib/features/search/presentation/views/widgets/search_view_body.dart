import 'package:flutter/material.dart';
import 'package:fruits_hub/core/constants.dart';
import 'package:fruits_hub/core/controller/products_controller.dart';
import 'package:fruits_hub/features/search/presentation/views/widgets/custom_app_bar_search.dart';
import 'package:fruits_hub/features/search/presentation/views/widgets/recent_search_list.dart';
import 'package:fruits_hub/features/search/presentation/views/widgets/search_results_grid.dart';
import 'package:fruits_hub/features/search/presentation/views/widgets/search_text_field.dart';
import 'package:fruits_hub/features/home/presentation/views/widgets/products_view_header.dart';
import 'package:fruits_hub/features/search/presentation/views/widgets/filter_bottom_sheet.dart';
import 'package:fruits_hub/features/search/presentation/controller/voice_search_controller.dart';
import 'package:fruits_hub/generated/l10n.dart';
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
    WidgetsBinding.instance.addPostFrameCallback((_) {
      controller.clearSearch();
      final args = Get.arguments;
      if (args is Map && args['action'] == 'filter') {
        showModalBottomSheet(
          context: context,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
          ),
          builder: (_) => const FilterBottomSheet(),
        );
      } else if (args is Map && args['action'] == 'voice') {
        if (Get.isRegistered<VoiceSearchController>()) {
          Get.find<VoiceSearchController>().toggleListening();
        }
      }
    });
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

                buildAppBarSearch(title: S.of(context).search),

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
                Obx(() {
                  final count = controller.filteredProducts.length;

      if (count == 0) {
        return const SizedBox();
      }
                  return ProductsViewHeader(
                    productsLength: count,
                  );
                }),

                const SizedBox(height: 16),
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
