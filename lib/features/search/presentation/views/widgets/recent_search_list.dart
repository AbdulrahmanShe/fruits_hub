import 'package:flutter/material.dart';
import 'package:fruits_hub/core/utils/app_text_styles.dart';
import 'package:fruits_hub/generated/l10n.dart';
import 'package:get/get.dart';
import 'package:fruits_hub/core/controller/products_controller.dart';

class RecentSearchList extends StatelessWidget {
  const RecentSearchList({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<ProductsController>();

    return Obx(() {
      if (controller.recentSearches.isEmpty) return const SizedBox();

      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(S.of(context).recentSearches, style: TextStyles.semiBold13),
              const Spacer(),
               GestureDetector(
                onTap: () => controller.clearRecentSearches(),
                 child: Text(
                  S.of(context).deleteAll,
                  style: TextStyles.regular13.copyWith(
              color: const Color(0xFF949D9E),
                  ),
                  
                  ),
               ),
            ],
          ),
          const SizedBox(height: 8),
          ...controller.recentSearches.map(
            (item) => ListTile(
              leading: Icon(Icons.history),
              title: Text(item),
              trailing: IconButton(
                icon: const Icon(Icons.close),
                onPressed: () => controller.removeRecent(item),
              ),
              onTap: () {
                controller.search(item);
              },
            ),
          ),
        ],
      );
    });
  }
}
