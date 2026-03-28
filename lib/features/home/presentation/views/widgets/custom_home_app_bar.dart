import 'package:flutter/material.dart';
import 'package:fruits_hub/core/utils/app_images.dart';
import 'package:fruits_hub/core/utils/app_text_styles.dart';
import 'package:fruits_hub/features/home/presentation/controller/cart_controller.dart';
import 'package:fruits_hub/features/home/presentation/controller/main_controller.dart';
import 'package:fruits_hub/features/home/presentation/controller/profile_controller.dart';
import 'package:fruits_hub/generated/l10n.dart';
import 'package:get/get.dart';
import 'package:svg_flutter/svg.dart';

class CustomHomeAppBar extends StatelessWidget {
  const CustomHomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    final profileController = Get.find<ProfileController>();
    final cartController = Get.find<CartController>();
    final mainController = Get.find<MainController>();

    return Obx(() {
      final colors = Theme.of(context).colorScheme;
      final isRtl = Directionality.of(context) == TextDirection.rtl;
      final avatarPath =
          profileController.gender.value == 'female'
              ? Assets.imagesProfileImageFemale
              : Assets.imagesProfileImageMale;
      final name =
          profileController.userName.value.isEmpty
              ? S.of(context).defaultUser
              : profileController.userName.value;

      return ListTile(
        horizontalTitleGap: isRtl ? 16 : 8,
        minLeadingWidth: isRtl ? 0 : 40,
        trailing: InkWell(
          onTap: () {
            mainController.setIndex(2);
          },
          borderRadius: BorderRadius.circular(999),
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                decoration: ShapeDecoration(
                  color: colors.primary.withValues(alpha: 0.12),
                  shape: const OvalBorder(),
                ),
                child: SvgPicture.asset(
                  Assets.imagesVuesaxOutlineShoppingCart,
                  width: 20,
                  height: 20,
                  colorFilter: ColorFilter.mode(
                    colors.primary,
                    BlendMode.srcIn,
                  ),
                ),
              ),
              PositionedDirectional(
                end: -2,
                top: -2,
                child: Obx(() {
                  final count = cartController.totalItems;
                  if (count == 0) {
                    return const SizedBox.shrink();
                  }
                  return Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 6,
                      vertical: 2,
                    ),
                    decoration: BoxDecoration(
                      color: colors.error,
                      borderRadius: BorderRadius.circular(999),
                      border: Border.all(
                        color: colors.surface,
                        width: 1,
                      ),
                    ),
                    child: Text(
                      count > 99 ? '99+' : count.toString(),
                      style: TextStyles.regular13.copyWith(
                        color: colors.onError,
                        fontSize: 10,
                      ),
                    ),
                  );
                }),
              ),
            ],
          ),
        ),
        leading: ClipOval(
          child: Image.asset(
            avatarPath,
            fit: BoxFit.cover,
          ),
        ),
        title: Text(
          S.of(context).welcomeBack,
          textAlign: isRtl ? TextAlign.right : TextAlign.left,
          style: TextStyles.regular16.copyWith(
            color: colors.onSurface.withValues(alpha: 0.6),
          ),
        ),
        subtitle: Text(
          name,
          textAlign: isRtl ? TextAlign.right : TextAlign.left,
          style: TextStyles.bold16,
        ),
      );
    });
  }
}
