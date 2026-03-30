import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:fruits_hub/core/utils/app_text_styles.dart';
import 'package:fruits_hub/features/auth/presentation/views/widgets/custom_check_box.dart';
import 'package:fruits_hub/features/auth/presentation/views/widgets/terms_and_conditions_view.dart';
import 'package:fruits_hub/generated/l10n.dart';
import 'package:get/get.dart';

class TermsAndConditions extends StatefulWidget {
  const TermsAndConditions({super.key, required this.onChanged});
   final ValueChanged<bool> onChanged;

  @override
  State<TermsAndConditions> createState() => _TermsAndConditionsState();
}

class _TermsAndConditionsState extends State<TermsAndConditions> {
   bool isTermsAccepted = false;
   late TapGestureRecognizer _tapRecognizer;

@override
void initState() {
  super.initState();
  _tapRecognizer = TapGestureRecognizer()
    ..onTap = () {
      Get.toNamed(TermsAndConditionsView.routeName);
    };
}

@override
void dispose() {
  _tapRecognizer.dispose();
  super.dispose();
}

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return  
    // Transform.translate(
    //   offset: const Offset(14, 0),
      // child: 
      Obx(() {
        return Row(
          children: [
            // Checkbox(value: false, onChanged: (value){}),
            CustomCheckBox(
            onChecked: (value) {
            setState(() {
              isTermsAccepted = value;
            });
            widget.onChanged(value);
          },
            isChecked: isTermsAccepted,
          ),
          const SizedBox(
            width: 16,
          ),

            Expanded(
            child: Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text: S.of(context).termsAcceptancePrefix,
                    style: TextStyles.semiBold13.copyWith(
                      color: colors.onSurface.withValues(alpha: 0.6),
                    ),
                  ),
                  TextSpan(
                    recognizer: _tapRecognizer,
                    text: S.of(context).ourTermsAndConditions,
                    style: TextStyles.semiBold13.copyWith(
                      color: colors.primary,
                    ),
                  ),
                ],
              ),
            ),
            ),
            
          ],
        );
      });
      // ),
  }
}
