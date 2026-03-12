import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:fruits_hub/core/utils/app_text_styles.dart';
import 'package:fruits_hub/features/auth/presentation/views/sign_up_view.dart';
import 'package:fruits_hub/generated/l10n.dart';
import 'package:get/get.dart';

class DontHaveAccountWidget extends StatelessWidget {
  const DontHaveAccountWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: S.of(context).dontHaveAccount,
                      style: TextStyles.semiBold16.copyWith(
                        color: colors.onSurface.withValues(alpha: 0.6),
                          ),
                    ),
                    TextSpan(
                      recognizer: TapGestureRecognizer()..onTap = (){
                        Get.toNamed(SignUpView.routeName);
                      },
                      text: S.of(context).createAccount,
                      style:
                        TextStyles.semiBold16.copyWith(color: colors.primary),
                      ),
                    
                  ]
                )
              );
  }
}
