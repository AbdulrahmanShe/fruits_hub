import 'package:flutter/material.dart';
import 'package:fruits_hub/core/utils/app_text_styles.dart';

class InActiveStepItem extends StatelessWidget {
  const InActiveStepItem({super.key, required this.index, required this.text});

  final String index;
  final String text;
  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CircleAvatar(
          radius: 10,
          backgroundColor: colors.surface,
          child: Text(
            index,
            style: TextStyles.semiBold13.copyWith(color: colors.onSurface),
          ),
        ),
        const SizedBox(
          width: 4,
        ),
        Text(
          text,
          style: TextStyles.semiBold13.copyWith(
            color: colors.onSurface.withValues(alpha: 0.5),
          ),
        )
      ],
    );
  }
}
