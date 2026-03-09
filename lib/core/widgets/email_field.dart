import 'package:flutter/material.dart';
import 'package:fruits_hub/core/widgets/custom_text_form_field.dart';
import 'package:fruits_hub/generated/l10n.dart';

class EmailField extends StatelessWidget {
  const EmailField({
    super.key,
    this.onChanged,
    this.hintText,
    this.controller,
  });

  final void Function(String)? onChanged;
  final String? hintText;
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
      hintText: hintText ?? S.of(context).email,
      textInputType: TextInputType.emailAddress,
      controller: controller,
      onChanged: onChanged,
      validator: (value) {
        if (value == null || value.trim().isEmpty) {
          return S.of(context).emailRequired;
        }

        final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');

        if (!emailRegex.hasMatch(value.trim())) {
          return S.of(context).invalidEmail;
        }

        return null;
      },
    );
  }
}
