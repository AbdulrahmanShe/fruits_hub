import 'package:flutter/material.dart';
import 'package:fruits_hub/core/utils/app_images.dart';
import 'package:svg_flutter/svg.dart';

class NotificationWidget extends StatelessWidget {
  const NotificationWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return Container(
      padding: EdgeInsets.all(12),
      decoration: ShapeDecoration(
        color: colors.primary.withValues(alpha: 0.12),
        shape: OvalBorder()
        ),
        child: SvgPicture.asset(
          Assets.imagesNotification,
          colorFilter: ColorFilter.mode(
            colors.primary,
            BlendMode.srcIn,
          ),
        ),
    );
  }
}
