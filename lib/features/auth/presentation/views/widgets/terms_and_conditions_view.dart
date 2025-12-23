import 'package:flutter/material.dart';
import 'package:fruits_hub/core/utils/app_text_styles.dart';
import 'package:fruits_hub/core/widgets/custom_app_bar.dart';

class TermsAndConditionsView extends StatelessWidget {
  const TermsAndConditionsView({super.key});
  static const routeName = "/termsAndConditionsView";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(
        context, 
        title: 'الشروط والأحكام',
        ),
        body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Text(
            '''
مرحبا بك في تطبيقنا!

يرجى قراءة الشروط والأحكام التالية بعناية قبل استخدام التطبيق:

1. استخدام التطبيق يعني موافقتك على هذه الشروط.
2. لا يجوز استخدام التطبيق لأي أغراض غير قانونية.
3. نحن غير مسؤولين عن أي خسائر ناتجة عن استخدام التطبيق.
4. المحتوى المعروض في التطبيق محمي بحقوق الطبع والنشر.
5. يحق لنا تعديل الشروط في أي وقت، ويكون التعديل ساري المفعول فور نشره.
6. إذا لم توافق على هذه الشروط، يُرجى عدم استخدام التطبيق.

شكرًا لاستخدامك تطبيقنا!
            ''',
            style: TextStyles.semiBold16.copyWith(
                        color: const Color(0xFF949D9E),
              height: 1.5,
            ),
          ),
        ),
      ),
    );
  }
}