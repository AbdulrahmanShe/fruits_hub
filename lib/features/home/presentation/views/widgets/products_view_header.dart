import 'package:flutter/material.dart';
import 'package:fruits_hub/core/utils/app_text_styles.dart';
import 'package:fruits_hub/generated/l10n.dart';

class ProductsViewHeader extends StatelessWidget {
  const ProductsViewHeader({super.key, required this.productsLength});
  final int productsLength;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          S.of(context).resultsCount(productsLength.toString()),
          textAlign: TextAlign.right,
          style: TextStyles.bold16,
        ),
        const Spacer(),
        SizedBox.shrink(),
      ],
    );
  }
}
