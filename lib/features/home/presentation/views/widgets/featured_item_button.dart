import 'package:flutter/material.dart';
import 'package:fruits_hub/core/utils/app_colors.dart';
import 'package:fruits_hub/core/utils/app_text_styles.dart';
import 'package:fruits_hub/generated/l10n.dart';

class FeaturedItemButton extends StatelessWidget {
  const FeaturedItemButton({super.key, required this.onPressed});
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return SizedBox(
      height: 32,
      child: TextButton(
        style: ButtonStyle(
          backgroundColor: MaterialStatePropertyAll(colors.surface),
          foregroundColor: MaterialStatePropertyAll(colors.primary),
          overlayColor: MaterialStateProperty.resolveWith(
            (states) {
              if (states.contains(MaterialState.pressed)) {
                return colors.primary.withValues(alpha: 0.12);
              }
              if (states.contains(MaterialState.hovered)) {
                return colors.primary.withValues(alpha: 0.08);
              }
              return null;
            },
          ),
          side: MaterialStatePropertyAll(
            BorderSide(
              color: colors.primary.withValues(alpha: 0.24),
            ),
          ),
          shape: MaterialStatePropertyAll(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(4),
            ),
          ),
        ),
        onPressed: onPressed,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: FittedBox(
            child: Text(
              S.of(context).shopNow,
              style: TextStyles.bold13.copyWith(
                color: colors.primary,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
