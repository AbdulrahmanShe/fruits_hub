import 'package:flutter/material.dart';
import 'package:fruits_hub/core/widgets/custom_text_form_field.dart';
import 'package:fruits_hub/generated/l10n.dart';

class PasswordField extends StatefulWidget {
  const PasswordField({
    super.key,
    this.onChanged,
    this.obscureText = true,
    this.hintText,
  });

  final void Function(String)? onChanged;
  final bool obscureText;
  final String? hintText;

  @override
  State<PasswordField> createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {

late bool obscureText;
late String? hintText;

@override
  void initState() {
    super.initState();
    obscureText = widget.obscureText;
    hintText = widget.hintText;
  }

  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
      validator: (value) {
  if (value == null || value.isEmpty) {
    return S.of(context).passwordRequired;
  }
  if (value.length < 6) {
    return S.of(context).passwordMinLength;
  }
  return null;
},

      obscureText: obscureText,
       hintText: hintText ?? S.of(context).password, 
          textInputType: TextInputType.visiblePassword,
            onChanged: widget.onChanged,
          suffixIcon: GestureDetector(
            onTap: (){
              setState(() {
            obscureText = !obscureText;
          });
            },
            child: Icon(
              obscureText ?
            Icons.remove_red_eye :
            Icons.visibility_off,
            color: Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.45),
            ) , 
            ),
          );
  }
}
