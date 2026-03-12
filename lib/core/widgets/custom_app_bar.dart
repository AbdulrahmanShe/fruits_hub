import 'package:flutter/material.dart';
import 'package:fruits_hub/core/utils/app_text_styles.dart';
import 'package:get/get.dart';

AppBar buildAppBar(context, {required String title, bool showBackBottom = true,}) {
    final theme = Theme.of(context);
    final colors = theme.colorScheme;
    return AppBar(
      backgroundColor: theme.scaffoldBackgroundColor,
      leading: Visibility(
        visible: showBackBottom,
        child: IconButton(
          onPressed: ()=> Get.back(),
         icon: Icon(Icons.arrow_back_ios_new, color: colors.onSurface),
         ),
      ),
      centerTitle: true,
      title: Text(
        title,
        style: TextStyles.bold19.copyWith(color: colors.onSurface),
        ),
    );
  }
