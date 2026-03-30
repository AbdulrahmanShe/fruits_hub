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
    final content = S.of(context).termsAndConditionsContent;
    final lines =
        content.split('\n').map((line) => line.trim()).where((line) => line.isNotEmpty).toList();

    return Scaffold(
      appBar: buildAppBar(
        context, 
        title: S.of(context).termsAndConditions,
        ),
        body: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: colors.primary.withValues(alpha: 0.08),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: colors.outline.withValues(alpha: 0.3)),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 36,
                    height: 36,
                    decoration: BoxDecoration(
                      color: colors.primary,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Icon(
                      Icons.gavel_rounded,
                      color: colors.onPrimary,
                      size: 20,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          S.of(context).termsAndConditions,
                          style: TextStyles.bold16.copyWith(color: colors.onSurface),
                        ),
                        const SizedBox(height: 6),
                        Text(
                          S.of(context).termsAcceptancePrefix,
                          style: TextStyles.regular13.copyWith(
                            color: colors.onSurface.withValues(alpha: 0.7),
                            height: 1.5,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: colors.surface,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: colors.outline.withValues(alpha: 0.3)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: _buildContent(lines, colors),
              ),
            ),
          ],
        ),
    );
  }

  List<Widget> _buildContent(List<String> lines, ColorScheme colors) {
    final List<Widget> widgets = [];
    final ruleRegex = RegExp(r'^(\d+)\.\s*(.*)$');

    for (final line in lines) {
      final match = ruleRegex.firstMatch(line);
      if (match != null) {
        final number = match.group(1) ?? '';
        final text = match.group(2) ?? '';
        widgets.add(
          Padding(
            padding: const EdgeInsets.only(bottom: 12),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 26,
                  height: 26,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: colors.primary.withValues(alpha: 0.12),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    number,
                    style: TextStyles.semiBold13.copyWith(
                      color: colors.primary,
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Text(
                    text,
                    style: TextStyles.regular13.copyWith(
                      color: colors.onSurface.withValues(alpha: 0.75),
                      height: 1.6,
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      } else {
        widgets.add(
          Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: Text(
              line,
              style: TextStyles.regular13.copyWith(
                color: colors.onSurface.withValues(alpha: 0.75),
                height: 1.6,
              ),
            ),
          ),
        );
      }
    }

    if (widgets.isNotEmpty) {
      widgets.removeLast();
    }
    return widgets;
  }
}
