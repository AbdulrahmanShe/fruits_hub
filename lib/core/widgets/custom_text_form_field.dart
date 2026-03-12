import 'package:flutter/material.dart';
import 'package:fruits_hub/core/utils/app_text_styles.dart';
import 'package:fruits_hub/generated/l10n.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    required this.hintText,
    required this.textInputType,
    this.suffixIcon,
    this.onChanged,
    this.obscureText = false,
    this.validator,
    this.onSaved,
    this.controller,
    this.readOnly = false,
  });

  final String hintText;
  final Function(String?)? onSaved;
  final TextInputType textInputType;
  final Widget? suffixIcon;
  final ValueChanged<String>? onChanged;
  final bool obscureText;
  final String? Function(String?)? validator;
  final TextEditingController? controller;
  final bool readOnly;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = theme.colorScheme;
    return TextFormField(
      controller: controller,
      validator:
          validator ??
          (value) {
            if (value == null || value.isEmpty) {
              return S.of(context).fieldRequired;
            }
            return null;
          },
      keyboardType: textInputType,
      obscureText: obscureText,
      readOnly: readOnly,
      onSaved: onSaved,
      onChanged: onChanged,
      decoration: InputDecoration(
        suffixIcon: suffixIcon,
        hintText: hintText,
        hintStyle: TextStyles.bold13.copyWith(
          color: colors.onSurface.withValues(alpha: 0.5),
        ),
        filled: true,
        fillColor: theme.inputDecorationTheme.fillColor ?? colors.surface,
        border: buildBorder(context),
        enabledBorder: buildBorder(context),
        focusedBorder: buildBorder(context),
      ),
    );
  }

  OutlineInputBorder buildBorder(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(4),
      borderSide: BorderSide(
        width: 1,
        color: colors.outline.withValues(alpha: 0.4),
      ),
    );
  }
}
