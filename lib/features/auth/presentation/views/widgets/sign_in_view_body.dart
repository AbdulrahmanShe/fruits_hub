import 'dart:io';
import 'package:flutter/material.dart';
import 'package:fruits_hub/core/constants.dart';
import 'package:fruits_hub/core/utils/app_images.dart';
import 'package:fruits_hub/core/utils/app_text_styles.dart';
import 'package:fruits_hub/core/widgets/custom_button.dart';
import 'package:fruits_hub/core/widgets/email_field.dart';
import 'package:fruits_hub/core/widgets/password_field.dart';
import 'package:fruits_hub/features/auth/presentation/controller/auth_controller.dart';
import 'package:fruits_hub/features/auth/presentation/views/widgets/dont_have_account_widget.dart';
import 'package:fruits_hub/features/auth/presentation/views/widgets/forgot_password_view.dart';
import 'package:fruits_hub/features/auth/presentation/views/widgets/or_divider.dart';
import 'package:fruits_hub/features/auth/presentation/views/widgets/social_login_button.dart';
import 'package:fruits_hub/features/home/presentation/views/home_view.dart';
import 'package:get/get.dart';

class SignInViewBody extends StatefulWidget {
  const SignInViewBody({super.key});

  @override
  State<SignInViewBody> createState() => _SignInViewBodyState();
}

class _SignInViewBodyState extends State<SignInViewBody> {

  final AuthController controller = Get.find<AuthController>();
  late String email, password;

  final GlobalKey<FormState> formKey = GlobalKey<FormState>(); 

  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: kHorizintalPadding
        ),
        child: Form(
          key: formKey,
          autovalidateMode: autovalidateMode,
          child: Column(
            children: [
              SizedBox(height: 24,),

              EmailField(
                onChanged: (value) {
                  email = value;
                },
                ),

                SizedBox(height: 16,),

              PasswordField(
                obscureText: true,
                onChanged: (value){
                  password = value;
                },
              ),
              
                const SizedBox(
                    height: 16,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                        onPressed: (){
                          Get.toNamed(ForgotPasswordView.routeName);
                        },
                        child: Text(
                        'نسيت كلمة المرور؟',
                        style: TextStyles.semiBold13.copyWith(
                          color: const Color.fromARGB(255, 51, 186, 107),
                        ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 33,
                  ),
                  Obx((){
                    return CustomButton(
                                  
                      text: controller.isLoading.value 
                      ? 'جاري تسجيل الدخول...' 
                      : 'تسجيل دخول',
                                  
                      onPressed: controller.isLoading.value 
                                  ? (){return;}
                                  : () async { 
                                    if (!formKey.currentState!.validate()) {
                      setState(() => autovalidateMode = AutovalidateMode.always);
                      return;
                    }
                    
                    formKey.currentState!.save();
                                  
                    bool success = await controller.signInWithEmailAndPassword(
                      email: email,
                      password: password,
                    );
                                  
                    if (success) {
                      Get.toNamed(HomeView.routeName);
                    }
                                    },
                      
                    );
                  }
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