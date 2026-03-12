import 'package:flutter/material.dart';
import 'package:fruits_hub/core/utils/app_text_styles.dart';
import 'package:fruits_hub/core/widgets/notification_widget.dart';
import 'package:get/get.dart';

AppBar buildAppBarNotification(BuildContext context, {required String title,  bool showBackBottom = true, bool showNotification = true,}) {
    final theme = Theme.of(context);
    final colors = theme.colorScheme;
    return AppBar(
      backgroundColor: theme.scaffoldBackgroundColor,
      // elevation: 0,
      leading: Visibility(
        visible: showBackBottom,
        child: IconButton(
          onPressed: ()=> Get.back(),
         icon: Icon(Icons.arrow_back_ios_new, color: colors.onSurface),
         ),
      ),
      title: Center(
        child: Text(
          title,
          style: TextStyles.bold19.copyWith(color: colors.onSurface),
          ),
      ),
        actions: [
          Visibility(
            visible: showNotification,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: NotificationWidget(),
            ),
          ),
        ],
    );
  }
