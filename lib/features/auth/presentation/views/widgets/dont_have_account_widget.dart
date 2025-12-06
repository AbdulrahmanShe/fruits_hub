import 'package:flutter/material.dart';
import 'package:fruits_hub/core/utils/app_colors.dart';
import 'package:fruits_hub/core/utils/app_text_styles.dart';

Text DontHaveAnAccountWidget() {
    return Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: 'لا تمتلك حساب؟ ',
                      style: TextStyles.semiBold16.copyWith(
                        color: const Color(0xFF949D9E),
                          ),
                    ),
                    TextSpan(
                      text: 'قم بإنشاء حساب ',
                      style:
                        TextStyles.semiBold16.copyWith(color: AppColors.primaryColor),
                      ),
                    
                  ]
                )
              );
  }