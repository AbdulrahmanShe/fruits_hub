import 'package:flutter/material.dart';
import 'package:fruits_hub/core/utils/app_text_styles.dart';
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
             Text(
              'الفلترة',
              style: TextStyles.bold19,
            ),

            const SizedBox(height: 24),

            /// 🧺 فلترة التصنيف
            const Text(
              'التصنيف',
              style: TextStyles.bold19,
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
                style: TextStyles.bold19,
              ),
              const SizedBox(height: 8),
          
              Text(
                '${controller.minPrice.value.toInt()} ₪  -  ${controller.maxPrice.value.toInt()} ₪',
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
                  child: const Text('تصفيه',style: TextStyles.bold16,),
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}
