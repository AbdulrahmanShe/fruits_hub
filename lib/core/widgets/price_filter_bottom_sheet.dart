import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:fruits_hub/core/controller/products_controller.dart';

class PriceFilterBottomSheet extends StatelessWidget {
  const PriceFilterBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<ProductsController>();

    return Padding(
      padding: const EdgeInsets.all(16),
      child: Obx(() {
        return Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'تصفية حسب السعر',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),

            Text(
              '${controller.minPrice.value.toInt()} \$  -  ${controller.maxPrice.value.toInt()} \$',
            ),

            RangeSlider(
              min: 0,
              max: 100,
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

            const SizedBox(height: 16),

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
        );
      }),
    );
  }
}
