import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:fruits_hub/core/controller/products_controller.dart';

class FilterBottomSheet extends StatelessWidget {
  const FilterBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<ProductsController>();

    return Padding(
      padding: const EdgeInsets.all(16),
      child: Obx(() {
        return SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// 🧾 العنوان
            const Text(
              'الفلترة',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 24),

            /// 🧺 فلترة التصنيف
            const Text(
              'التصنيف',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),

            Wrap(
              spacing: 8,
              children: controller.categories.map((category) {
                final isSelected =
                    controller.selectedCategory.value == category;

                return ChoiceChip(
                  label: Text(category),
                  selected: isSelected,
                  onSelected: (_) {
                    controller.selectedCategory.value = category;
                  },
                );
              }).toList(),
            ),

            const SizedBox(height: 24),
              /// 💰 فلترة السعر
              const Text(
                ' السعر',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
          
              Text(
                '${controller.minPrice.value.toInt()} \$  -  ${controller.maxPrice.value.toInt()} \$',
              ),
          
              RangeSlider(
                min: 0,
                max: 20,
                divisions: 20,
                values: RangeValues(
                  controller.minPrice.value,
                  controller.maxPrice.value,
                ),
                onChanged: (values) {
                  controller.minPrice.value = values.start;
                  controller.maxPrice.value = values.end;
                },
              ),
          
              const SizedBox(height: 24),
          
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    controller.applyFilter();
                    Get.back();
                  },
                  child: const Text('تطبيق'),
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}
