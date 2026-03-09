import 'package:flutter/material.dart';
import 'package:fruits_hub/core/constants.dart';
import 'package:fruits_hub/core/services/shared_preferences_singleton.dart';
import 'package:fruits_hub/core/utils/app_colors.dart';
import 'package:fruits_hub/core/utils/app_text_styles.dart';
import 'package:fruits_hub/core/widgets/custom_app_bar.dart';
import 'package:fruits_hub/generated/l10n.dart';
import 'package:get/get.dart';

class LanguageView extends StatefulWidget {
  const LanguageView({super.key});

  static const routeName = '/languageView';

  @override
  State<LanguageView> createState() => _LanguageViewState();
}

class _LanguageViewState extends State<LanguageView> {
  late String selectedLanguageCode;

  @override
  void initState() {
    super.initState();
    selectedLanguageCode =
        Prefs.getString(kAppLanguage).isEmpty
            ? 'ar'
            : Prefs.getString(kAppLanguage);
  }

  Future<void> _onLanguageSelected(String code) async {
    if (selectedLanguageCode == code) {
      return;
    }
    await Prefs.setString(kAppLanguage, code);
    await Get.updateLocale(Locale(code));
    setState(() {
      selectedLanguageCode = code;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context, title: S.of(context).language),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            _LanguageTile(
              title: S.of(context).arabic,
              subtitle: 'Arabic',
              value: 'ar',
              groupValue: selectedLanguageCode,
              onChanged: _onLanguageSelected,
            ),
            const SizedBox(height: 12),
            _LanguageTile(
              title: 'English',
              subtitle: S.of(context).english,
              value: 'en',
              groupValue: selectedLanguageCode,
              onChanged: _onLanguageSelected,
            ),
            const SizedBox(height: 24),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: const Color(0xFFF3F7F4),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text(
                S.of(context).languageAppliedImmediatelyAfterSelection,
                style: TextStyles.regular13.copyWith(
                  color: const Color(0xFF4A5552),
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _LanguageTile extends StatelessWidget {
  const _LanguageTile({
    required this.title,
    required this.subtitle,
    required this.value,
    required this.groupValue,
    required this.onChanged,
  });

  final String title;
  final String subtitle;
  final String value;
  final String groupValue;
  final ValueChanged<String> onChanged;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(12),
      onTap: () => onChanged(value),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color:
                groupValue == value
                    ? AppColors.primaryColor
                    : const Color(0xFFE1E4E3),
          ),
        ),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title, style: TextStyles.bold16),
                  const SizedBox(height: 2),
                  Text(
                    subtitle,
                    style: TextStyles.regular13.copyWith(
                      color: const Color(0xFF7C8481),
                    ),
                  ),
                ],
              ),
            ),
            Icon(
              groupValue == value
                  ? Icons.radio_button_checked
                  : Icons.radio_button_off,
              color:
                  groupValue == value
                      ? AppColors.primaryColor
                      : const Color(0xFFB6BFBC),
            ),
          ],
        ),
      ),
    );
  }
}
