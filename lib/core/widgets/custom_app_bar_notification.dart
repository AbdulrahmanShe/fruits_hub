import 'package:flutter/material.dart';
import 'package:fruits_hub/core/utils/app_colors.dart';
import 'package:fruits_hub/core/utils/app_text_styles.dart';
import 'package:fruits_hub/core/widgets/notification_widget.dart';
import 'package:get/get.dart';

AppBar buildAppBarNotification({required String title,  bool showBackBottom = true,}) {
    return AppBar(
      backgroundColor: AppColors.white,
      elevation: 0,
      leading: Visibility(
        visible: showBackBottom,
        child: IconButton(
          onPressed: ()=> Get.back(),
         icon: Icon(Icons.arrow_back_ios_new),
         ),
      ),
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