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
    final colors = Theme.of(context).colorScheme;

    return Obx(() {
      if (controller.recentSearches.isEmpty) return const SizedBox();

      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                S.of(context).recentSearches,
                style: TextStyles.semiBold13.copyWith(color: colors.onSurface),
              ),
              const Spacer(),
               GestureDetector(
                onTap: () => controller.clearRecentSearches(),
                 child: Text(
                  S.of(context).deleteAll,
                  style: TextStyles.regular13.copyWith(
              color: colors.onSurface.withValues(alpha: 0.6),
                  ),
                  
                  ),
               ),
            ],
          ),
          const SizedBox(height: 8),
          ...controller.recentSearches.map(
            (item) => ListTile(
              leading: Icon(Icons.history, color: colors.onSurface.withValues(alpha: 0.6)),
              title: Text(item, style: TextStyles.regular13.copyWith(color: colors.onSurface)),
              trailing: IconButton(
                icon: Icon(Icons.close, color: colors.onSurface.withValues(alpha: 0.6)),
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
