import 'package:flutter/material.dart';
import 'package:fruits_hub/core/utils/app_text_styles.dart';
import 'package:fruits_hub/core/widgets/custom_app_bar.dart';
import 'package:fruits_hub/generated/l10n.dart';

class TermsAndConditionsView extends StatelessWidget {
  const TermsAndConditionsView({super.key});
  static const routeName = "/termsAndConditionsView";

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return Scaffold(
      appBar: buildAppBar(
        context, 
        title: S.of(context).termsAndConditions,
        ),
        body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Text(
            S.of(context).termsAndConditionsContent,
            style: TextStyles.semiBold16.copyWith(
                        color: colors.onSurface.withValues(alpha: 0.6),
              height: 1.5,
            ),
          ),
        ),
      ),
    );
  }
}
