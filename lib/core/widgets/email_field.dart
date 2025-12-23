import 'package:flutter/material.dart';
import 'package:fruits_hub/core/widgets/custom_text_form_field.dart';

class EmailField extends StatelessWidget {
  const EmailField({
    super.key,
    this.onChanged,
    this.hintText = 'البريد الإلكتروني',
  });

  final void Function(String)? onChanged;
  final String hintText;

  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
      hintText: hintText,
      textInputType: TextInputType.emailAddress,
      onChanged: onChanged,
      validator: (value) {
        if (value == null || value.trim().isEmpty) {
          return 'البريد الإلكتروني مطلوب';
        }

        final emailRegex =
            RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');

        if (!emailRegex.hasMatch(value.trim())) {
          return 'صيغة البريد الإلكتروني غير صحيحة';
        }

        return null; // ✅ صحيح
      },
    );
  }
}
