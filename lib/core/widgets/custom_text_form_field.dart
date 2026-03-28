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
    this.focusNode,
    this.nextFocusNode,
    this.textInputAction,
    this.onFieldSubmitted,
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
  final FocusNode? focusNode;
  final FocusNode? nextFocusNode;
  final TextInputAction? textInputAction;
  final ValueChanged<String>? onFieldSubmitted;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = theme.colorScheme;
    return TextFormField(
      controller: controller,
      focusNode: focusNode,
      validator:
          validator ??
          (value) {
            if (value == null || value.isEmpty) {
              return S.of(context).fieldRequired;
            }
            return null;
          },
      keyboardType: textInputType,
      textInputAction:
          textInputAction ?? (nextFocusNode != null ? TextInputAction.next : null),
      obscureText: obscureText,
      readOnly: readOnly,
      onSaved: onSaved,
      onChanged: onChanged,
      onFieldSubmitted: (value) {
        if (onFieldSubmitted != null) {
          onFieldSubmitted!(value);
          return;
        }
        if (nextFocusNode != null) {
          FocusScope.of(context).requestFocus(nextFocusNode);
        } else {
          FocusScope.of(context).unfocus();
        }
      },
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
