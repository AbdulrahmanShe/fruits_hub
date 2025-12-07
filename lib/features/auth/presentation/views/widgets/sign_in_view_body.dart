import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fruits_hub/core/constants.dart';
import 'package:fruits_hub/core/utils/app_colors.dart';
import 'package:fruits_hub/core/utils/app_images.dart';
import 'package:fruits_hub/core/utils/app_text_styles.dart';
import 'package:fruits_hub/core/widgets/custom_button.dart';
import 'package:fruits_hub/core/widgets/custom_text_form_field.dart';
import 'package:fruits_hub/features/auth/presentation/views/widgets/dont_have_account_widget.dart';
import 'package:fruits_hub/features/auth/presentation/views/widgets/or_divider.dart';
import 'package:fruits_hub/features/auth/presentation/views/widgets/social_login_button.dart';

class SignInViewBody extends StatelessWidget {
  const SignInViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: kHorizintalPadding
        ),
        child: SingleChildScrollView(
          // scrollDirection: Axis.vertical,
          // clipBehavior: Clip.none,
          child: Column(
            children: [
              SizedBox(height: 24,),
              CustomTextFormField(
                hintText: 'البريد الالكتروني', 
                textInputType: TextInputType.emailAddress
                ),
                SizedBox(height: 16,),
              CustomTextFormField(
                suffixIcon: Icon(Icons.remove_red_eye,color: Color(0xffC9CECF),),
                hintText: 'كلمة المرور', 
                textInputType: TextInputType.visiblePassword
                ),
                const SizedBox(
                    height: 16,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        'نسيت كلمة المرور؟',
                        style: TextStyles.semiBold13.copyWith(
                          color: AppColors.lightPrimaryColor,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 33,
                  ),
                  CustomButton(
                    onPressed: () {
        
                    },
                    text: 'تسجيل دخول',
                  ),
                  const SizedBox(
                    height: 33,
                  ),
        
                   DontHaveAccountWidget(),
                  
                  const SizedBox(
                    height: 33,
                  ),
                  const OrDivider(),
                  const SizedBox(
                  height: 16,
                  ),
                  SocialLoginButton(
                  onPressed: () {
      
                  },
                  image: Assets.imagesGoogleIcon,
                  title: 'تسجيل بواسطة جوجل',
                ),
                const SizedBox(
                  height: 16,
                ),
                Platform.isIOS
                    ? Column(
                        children: [
                          SocialLoginButton(
                            onPressed: () {
      
                            },
                            image: Assets.imagesApplIcon,
                            title: 'تسجيل بواسطة أبل',
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                        ],
                      )
                    : const SizedBox(),
                SocialLoginButton(
                  onPressed: () {
                    
                  },
                  image: Assets.imagesFacebookIcon,
                  title: 'تسجيل بواسطة فيسبوك',
                ),
            ],
          ),
        ),
      ),
    );
  }

  
}