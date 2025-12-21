import 'package:flutter/material.dart';
import 'package:fruits_hub/core/constants.dart';
import 'package:fruits_hub/core/widgets/custom_button.dart';
import 'package:fruits_hub/core/widgets/custom_text_form_field.dart';
import 'package:fruits_hub/core/widgets/password_field.dart';
import 'package:fruits_hub/features/auth/presentation/controller/auth_controller.dart';
import 'package:fruits_hub/features/auth/presentation/views/sign_in_view.dart';
import 'package:fruits_hub/features/auth/presentation/views/widgets/have_an_account_widget.dart';
import 'package:fruits_hub/features/auth/presentation/views/widgets/terms_and_conditions.dart';
import 'package:get/get.dart';

class SignUpViewBody extends StatefulWidget {
  const SignUpViewBody({super.key});

  @override
  State<SignUpViewBody> createState() => _SignUpViewBodyState();
}

class _SignUpViewBodyState extends State<SignUpViewBody> {

  final AuthController controller = Get.find<AuthController>();
  late String email, userName, password;
  late bool isTermsAccepted = false;

  final GlobalKey<FormState> formKey = GlobalKey<FormState>(); 

  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: kHorizintalPadding),
        child: Form(
          key: formKey,
          autovalidateMode: autovalidateMode,
          child: Column(
            children: [
              SizedBox(height: 24,),
              CustomTextFormField(
                hintText: 'الإسم كامل', 
                textInputType: TextInputType.name,
                  onChanged: (value) {
                    userName = value;
                  },
                ),
              SizedBox(height: 16,),
              CustomTextFormField(
                hintText: 'البريد الإلكتروني', 
                textInputType: TextInputType.emailAddress,
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
              SizedBox(height: 16,),
              TermsAndConditions(
                onChanged: (value) {
                    isTermsAccepted = value;
                  },
                  ),
              SizedBox(height: 30,),
            Obx((){
              return CustomButton(
                text: controller.isLoading.value
                    ? 'جاري إنشاء الحساب...'
                    : 'إنشاء حساب جديد',
                onPressed: controller.isLoading.value 
                ? (){return;}
                : () async { 
                  if (formKey.currentState!.validate()) { 
                    formKey.currentState!.save(); 
                    if (isTermsAccepted) { 
                      bool success = await controller.signUpWithEmailAndPassword(
                         email: email,
                          password: password, 
                          name: userName, 
                          ); 
                          if (success) { 
                            Get.offNamed(SignInView.routeName); 
                            } 
                            }else { 
                              Get.snackbar(
                                 'تنبيه', 'يجب الموافقة على الشروط والأحكام', 
                                 snackPosition: SnackPosition.BOTTOM, 
                                 ); 
                                 return; 
                                 } 
                                 }else{ 
                                  setState(() {
                                    autovalidateMode = AutovalidateMode.always;
                                  }); 
                                  } 
                                  } 
                                  ); 
                                  }, 
                                  ),
            const SizedBox(
                  height: 26,
                ),
            HaveAnAccountWidget(),
            ],
          ),
        ),
      ),
    );
  }
}