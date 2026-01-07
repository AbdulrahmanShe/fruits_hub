import 'package:flutter/material.dart';
import 'package:fruits_hub/core/utils/app_colors.dart';
import 'package:fruits_hub/core/utils/app_text_styles.dart';
import 'package:get/get.dart';

AppBar buildAppBar(context, {required String title, bool showBackBottom = true,}) {
    return AppBar(
      backgroundColor: AppColors.white,
      leading: Visibility(
        visible: showBackBottom,
        child: IconButton(
          onPressed: ()=> Get.back(),
         icon: Icon(Icons.arrow_back_ios_new),
         ),
      ),
      centerTitle: true,
      title: Text(
        title,
        style: TextStyles.bold19,
        ),
    );
  }