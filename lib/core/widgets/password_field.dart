import 'package:flutter/material.dart';
import 'package:fruits_hub/core/widgets/custom_text_form_field.dart';

class PasswordField extends StatefulWidget {
  const PasswordField({
    super.key, this.onChanged, this.obscureText = true,
  });

  final void Function(String)? onChanged;
  final bool obscureText;

  @override
  State<PasswordField> createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {

late bool obscureText;

@override
  void initState() {
    super.initState();
    obscureText = widget.obscureText;
  }

  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
      obscureText: obscureText,
       hintText: 'كلمة المرور', 
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