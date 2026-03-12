import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:fruits_hub/core/utils/app_text_styles.dart';
import 'package:fruits_hub/generated/l10n.dart';
import 'package:get/get.dart';

class HaveAnAccountWidget extends StatelessWidget {
  const HaveAnAccountWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: S.of(context).alreadyHaveAccount,
                      style: TextStyles.semiBold16.copyWith(
                        color: colors.onSurface.withValues(alpha: 0.6),
                          ),
                    ),
                    TextSpan(
                      recognizer: TapGestureRecognizer()..onTap = (){
                        Get.back();
                      },
                      text: S.of(context).signIn,
                      style:
                        TextStyles.semiBold16.copyWith(color: colors.primary),
                      ),
                    
                  ]
                )
              );
  }
  }
