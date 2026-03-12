import 'package:flutter/material.dart';
import 'package:fruits_hub/core/utils/app_images.dart';
import 'package:fruits_hub/core/utils/app_text_styles.dart';
import 'package:fruits_hub/generated/l10n.dart';
import 'package:svg_flutter/svg.dart';

class ProductsViewHeader extends StatelessWidget {
  const ProductsViewHeader({super.key, required this.productsLength});
  final int productsLength;
  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return Row(
      children: [
        Text(
          S.of(context).resultsCount(productsLength.toString()),
          textAlign: TextAlign.right,
          style: TextStyles.bold16,
        ),
        const Spacer(),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          decoration: ShapeDecoration(
            color: colors.surface,
            shape: RoundedRectangleBorder(
              side: BorderSide(width: 1, color: colors.outline.withValues(alpha: 0.4)),
              borderRadius: BorderRadius.circular(4),
            ),
          ),
          child: SvgPicture.asset(
            Assets.imagesFilter2,
          ),
        )
      ],
    );
  }
}
