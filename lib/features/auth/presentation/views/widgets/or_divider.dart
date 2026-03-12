import 'package:flutter/material.dart';
import 'package:fruits_hub/core/utils/app_text_styles.dart';
import 'package:fruits_hub/generated/l10n.dart';

class OrDivider extends StatelessWidget {
  const OrDivider({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return Row(
      children: [
        Expanded(
          child: Divider(
            color: colors.outline.withValues(alpha: 0.4),
          ),
        ),
        const SizedBox(
          width: 18,
        ),
        Text(
          S.of(context).or,
          textAlign: TextAlign.center,
          style: TextStyles.semiBold16.copyWith(color: colors.onSurface),
        ),
        const SizedBox(
          width: 18,
        ),
        Expanded(
          child: Divider(
            color: colors.outline.withValues(alpha: 0.4),
          ),
        ),
      ],
    );
  }
}
