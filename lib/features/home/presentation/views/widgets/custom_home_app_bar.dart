import 'package:flutter/material.dart';
import 'package:fruits_hub/core/utils/app_images.dart';
import 'package:fruits_hub/core/utils/app_text_styles.dart';
import 'package:fruits_hub/core/widgets/notification_widget.dart';
import 'package:fruits_hub/features/home/presentation/controller/profile_controller.dart';
import 'package:fruits_hub/generated/l10n.dart';
import 'package:get/get.dart';

class CustomHomeAppBar extends StatelessWidget {
  const CustomHomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    final profileController = Get.find<ProfileController>();

    return Obx(() {
      final colors = Theme.of(context).colorScheme;
      final avatarPath =
          profileController.gender.value == 'female'
              ? Assets.imagesProfileImageFemale
              : Assets.imagesProfileImageMale;
      final name =
          profileController.userName.value.isEmpty
              ? S.of(context).defaultUser
              : profileController.userName.value;

      return ListTile(
        trailing: const NotificationWidget(),
        leading: ClipOval(
          child: Image.asset(
            avatarPath,
            fit: BoxFit.cover,
          ),
        ),
        title: Text(
          S.of(context).welcomeBack,
          textAlign: TextAlign.right,
          style: TextStyles.regular16.copyWith(
            color: colors.onSurface.withValues(alpha: 0.6),
          ),
        ),
        subtitle: Text(
          name,
          textAlign: TextAlign.right,
          style: TextStyles.bold16,
        ),
      );
    });
  }
}
