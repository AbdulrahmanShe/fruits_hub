import 'package:flutter/material.dart';
import 'package:fruits_hub/core/constants.dart';
import 'package:fruits_hub/core/utils/app_text_styles.dart';
import 'package:fruits_hub/core/widgets/custom_app_bar_notification.dart';
import 'package:fruits_hub/features/home/presentation/views/widgets/products_grid_view.dart';

class BestSellingView extends StatelessWidget {
  const BestSellingView({super.key});
  static const routeName = "/bestSellingView";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBarNotification(title: 'الأكثر مبيعا'),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: kTopPaddding,),
                  const Text(
              'الأكثر مبيعًا',
              style: TextStyles.bold16,
            ),
            SizedBox(height: 12,),
        
                ],
              ),
            ),
            ProductsGridView(),
          ],
        ),
      ),

    );
  }
}