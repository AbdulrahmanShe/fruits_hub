import 'package:flutter/material.dart';
import 'package:fruits_hub/features/search/presentation/controller/voice_search_controller.dart';
import 'package:fruits_hub/core/utils/app_text_styles.dart';
import 'package:get/get.dart';

AppBar buildAppBarSearch(BuildContext context, {required String title,}) {
  final controller = Get.find<VoiceSearchController>();
  final theme = Theme.of(context);
  final colors = theme.colorScheme;
    return AppBar(
      backgroundColor: theme.scaffoldBackgroundColor,
      // elevation: 0,
      leading: IconButton(
        onPressed: ()=> Get.back(),
       icon: Icon(Icons.arrow_back_ios_new, color: colors.onSurface),
       ),
      title: Center(
        child: Text(
          title,
          style: TextStyles.bold19.copyWith(color: colors.onSurface),
          ),
      ),
        actions: [
          IconButton(
            icon: Obx(() => Text(
              controller.currentLocale.value == 'ar' ? 'AR' : 'EN',
            )),
              onPressed: controller.toggleLanguage,
          ),
        ],
    );
  }
