import 'package:flutter/material.dart';
import 'package:fruits_hub/core/widgets/custom_app_bar.dart';
import 'package:fruits_hub/features/auth/presentation/views/widgets/sign_in_view_body.dart';
import 'package:fruits_hub/generated/l10n.dart';

class SignInView extends StatelessWidget {
  const SignInView({super.key});
  static const routeName = "/signInView";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(
        context,
        title: S.of(context).signIn,
        showBackBottom: false,
      ),
      body: SignInViewBody(),
    );
  }

  
}
