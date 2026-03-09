import 'package:flutter/material.dart';
import 'package:fruits_hub/core/controller/products_controller.dart';
import 'package:fruits_hub/core/utils/app_text_styles.dart';
import 'package:fruits_hub/generated/l10n.dart';
import 'package:fruits_hub/features/home/presentation/views/widgets/featured_view.dart';
import 'package:get/get.dart';

class FeaturedHeader extends StatelessWidget {
  const FeaturedHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        final controller = Get.find<ProductsController>();
        controller.setView(ProductsListView.featured);
        Get.toNamed(FeaturedView.routeName);
      },
      child: Row(
        children: [
          Text(
            S.of(context).featuredProducts,
            textAlign: TextAlign.right,
            style: TextStyles.bold16,
          ),
          const Spacer(),
          Text(
            S.of(context).more,
            textAlign: TextAlign.center,
            style: TextStyles.regular13.copyWith(
              color: const Color(0xFF949D9E),
            ),
          )
        ],
      ),
    );
  }
}
