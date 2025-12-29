import 'package:flutter/material.dart';
import 'package:fruits_hub/core/utils/app_text_styles.dart';
import 'package:fruits_hub/core/widgets/notification_widget.dart';

AppBar buildAppBarNotification({required String title,}) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      title: Center(
        child: Text(
          title,
          style: TextStyles.bold19,
          ),
      ),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: NotificationWidget(),
          ),
        ],
    );
  }