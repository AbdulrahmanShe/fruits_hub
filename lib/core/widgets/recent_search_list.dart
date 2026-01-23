import 'package:flutter/material.dart';
import 'package:fruits_hub/core/utils/app_text_styles.dart';
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
              const Text('عمليات البحث الأخيرة',
              style: TextStyles.semiBold13,
              ),
              Spacer(),
               GestureDetector(
                onTap: () => controller.clearRecentSearches(),
                 child: Text(
                  'حذف الكل',
                  style: TextStyles.regular13.copyWith(
                    color: Color(0xFFF949D9E),
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
