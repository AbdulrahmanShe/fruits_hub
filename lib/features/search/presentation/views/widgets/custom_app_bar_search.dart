import 'package:flutter/material.dart';
import 'package:fruits_hub/features/search/presentation/controller/voice_search_controller.dart';
import 'package:fruits_hub/core/utils/app_colors.dart';
import 'package:fruits_hub/core/utils/app_text_styles.dart';
import 'package:get/get.dart';

AppBar buildAppBarSearch({required String title,}) {
  final controller = Get.find<VoiceSearchController>();
    return AppBar(
      backgroundColor: AppColors.white,
      // elevation: 0,
      leading: IconButton(
        onPressed: ()=> Get.back(),
       icon: Icon(Icons.arrow_back_ios_new),
       ),
      title: Center(
        child: Text(
          title,
          style: TextStyles.bold19,
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