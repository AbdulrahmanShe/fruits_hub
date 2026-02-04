import 'package:flutter/material.dart';
import 'package:fruits_hub/core/controller/products_controller.dart';
import 'package:fruits_hub/features/home/presentation/views/widgets/category_item.dart';
import 'package:get/get.dart';

class CategoriesSection extends StatelessWidget {
  const CategoriesSection({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<ProductsController>();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'منتجاتنا',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 12),

        Obx(() {
          final categories = controller.categories;
          final selected = controller.selectedCategory.value;
          final categoriesMap = controller.categoriesWithProduct;

          return SizedBox(
            height: 90,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: categories.length,
              separatorBuilder: (_, __) => const SizedBox(width: 12),
              itemBuilder: (context, index) {
                final category = categories[index];
                final isSelected = selected == category;

                final imageUrl = category == 'الكل'
                    ? categoriesMap.values.first.imageUrl ?? ''
                    : categoriesMap[category]?.imageUrl ?? '';

                return GestureDetector(
                  onTap: () {
                    controller.selectCategory(category);
                  },
                  child: CategoryItem(
                    title: category,
                    imageUrl: imageUrl,
                    isSelected: isSelected,
                  ),
                );
              },
            ),
          );
        }),
      ],
    );
  }
}
