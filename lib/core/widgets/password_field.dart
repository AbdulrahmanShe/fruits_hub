import 'package:flutter/material.dart';
import 'package:fruits_hub/core/widgets/custom_text_form_field.dart';

class PasswordField extends StatefulWidget {
  const PasswordField({
    super.key, this.onChanged, this.obscureText = true, this.hintText = 'كلمة المرور',
  });

  final void Function(String)? onChanged;
  final bool obscureText;
  final String hintText;

  @override
  State<PasswordField> createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {

late bool obscureText;
late String hintText;

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
    return 'كلمة المرور مطلوبة';
  }
  if (value.length < 6) {
    return 'كلمة المرور يجب أن تكون 6 أحرف على الأقل';
  }
  return null;
},

      obscureText: obscureText,
       hintText: hintText, 
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
            color: Color(0xffC9CECF),
            ) , 
            ),
          );
  }
}