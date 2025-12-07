import 'package:flutter/material.dart';
import 'package:fruits_hub/core/constants.dart';
import 'package:fruits_hub/core/widgets/custom_button.dart';
import 'package:fruits_hub/core/widgets/custom_text_form_field.dart';
import 'package:fruits_hub/features/auth/presentation/views/widgets/have_an_account_widget.dart';
import 'package:fruits_hub/features/auth/presentation/views/widgets/terms_and_conditions.dart';

class SignUpViewBody extends StatefulWidget {
  const SignUpViewBody({super.key});

  @override
  State<SignUpViewBody> createState() => _SignUpViewBodyState();
}

class _SignUpViewBodyState extends State<SignUpViewBody> {
  late String email, userName, password;
  late bool isTermsAccepted = false;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: kHorizintalPadding),
        child: Column(
          children: [
            SizedBox(height: 24,),
            CustomTextFormField(hintText: 'الإسم كامل', textInputType: TextInputType.name),
            SizedBox(height: 16,),
            CustomTextFormField(hintText: 'البريد الإلكتروني', textInputType: TextInputType.emailAddress),
            SizedBox(height: 16,),
            CustomTextFormField(
                  suffixIcon: Icon(Icons.remove_red_eye,color: Color(0xffC9CECF),),
                  hintText: 'كلمة المرور', 
                  textInputType: TextInputType.visiblePassword
                  ),
            SizedBox(height: 16,),
            TermsAndConditions(
              onChanged: (value) {
                  isTermsAccepted = value;
                },
                ),
            SizedBox(height: 30,),
          CustomButton(onPressed: (){}, text: 'إنشاء حساب جديد'),
          const SizedBox(
                height: 26,
              ),
          HaveAnAccountWidget(),
          ],
        ),
      ),
    );
  }
}