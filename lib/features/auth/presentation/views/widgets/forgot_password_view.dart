import 'package:flutter/material.dart';
import 'package:fruits_hub/core/utils/app_text_styles.dart';
import 'package:fruits_hub/core/widgets/custom_app_bar.dart';
import 'package:fruits_hub/core/widgets/email_field.dart';
import 'package:fruits_hub/features/auth/presentation/controller/auth_controller.dart';
import 'package:fruits_hub/features/auth/presentation/views/sign_in_view.dart';
import 'package:get/get.dart';
import 'package:fruits_hub/core/constants.dart';
import 'package:fruits_hub/core/widgets/custom_bottom.dart';

class ForgotPasswordView extends StatefulWidget {
  const ForgotPasswordView({super.key});

  static const routeName = "/forgotPasswordView";

  @override
  State<ForgotPasswordView> createState() => _ForgotPasswordViewState();
}

class _ForgotPasswordViewState extends State<ForgotPasswordView> {
  final AuthController controller = Get.find<AuthController>();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  late String email;
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context, title: ' نسيت كلمة المرور',),
      body: Padding(
        padding: const EdgeInsets.all(kHorizintalPadding),
        child: Form(
          key: formKey,
          autovalidateMode: autovalidateMode,
          child: Column(
            children: [
              const SizedBox(height: 24),
              Text(
                'سيتم ارسال رابط على بريدك الالكتروني لتتمكن من اعادة تعيين كلمة المرور',
                      style: TextStyles.semiBold16.copyWith(
                        color: const Color(0xFF949D9E),
                          ),
                          ),
              const SizedBox(height: 24),
              EmailField(
                hintText: 'user@gmail.com',
                onChanged: (value) => email = value,
              ),
              const SizedBox(height: 16),
              Obx(() {
  return CustomBottom(
    text: controller.isLoading.value
        ? 'جاري الإرسال...'
        : 'نسيت كلمة المرور',
    onPressed: controller.isLoading.value
        ? (){}
        : () async {
            if (!formKey.currentState!.validate()) {
              setState(() => autovalidateMode = AutovalidateMode.always);
              return;
            }

            formKey.currentState!.save();

            final success =
                await controller.sendPasswordResetEmail(email: email);

            if (success) {
              Get.toNamed(
                SignInView.routeName,
              );
            }
          },
  );
}),

            ],
          ),
        ),
      ),
    );
  }
}
