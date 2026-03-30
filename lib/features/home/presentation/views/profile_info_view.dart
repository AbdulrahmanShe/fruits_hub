import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fruits_hub/core/constants.dart';
import 'package:fruits_hub/core/services/shared_preferences_singleton.dart';
import 'package:fruits_hub/core/utils/app_images.dart';
import 'package:fruits_hub/core/utils/app_text_styles.dart';
import 'package:fruits_hub/core/utils/backend_endpoint.dart';
import 'package:fruits_hub/core/utils/show_snack_bar.dart';
import 'package:fruits_hub/core/widgets/custom_app_bar.dart';
import 'package:fruits_hub/core/widgets/custom_bottom.dart';
import 'package:fruits_hub/core/widgets/custom_text_form_field.dart';
import 'package:fruits_hub/features/home/presentation/controller/profile_controller.dart';
import 'package:fruits_hub/generated/l10n.dart';
import 'package:get/get.dart';

class ProfileInfoView extends StatefulWidget {
  const ProfileInfoView({super.key});

  static const routeName = '/profileInfoView';

  @override
  State<ProfileInfoView> createState() => _ProfileInfoViewState();
}

class _ProfileInfoViewState extends State<ProfileInfoView> {
  final ProfileController profileController = Get.find<ProfileController>();

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();

  final Rx<AutovalidateMode> autovalidateMode =
      AutovalidateMode.disabled.obs;
  final RxBool isSaving = false.obs;
  final RxString selectedGender = 'male'.obs;

  @override
  void initState() {
    super.initState();
    _loadUser();
  }

  void _loadUser() {
    final rawUser = Prefs.getString(kUserData);
    if (rawUser.isNotEmpty) {
      try {
        final data = jsonDecode(rawUser) as Map<String, dynamic>;
        nameController.text = (data['name'] ?? '').toString();
        emailController.text = (data['email'] ?? '').toString();
        phoneController.text = (data['phone'] ?? '').toString();
        final gender = (data['gender'] ?? '').toString();
        selectedGender.value = gender == 'female' ? 'female' : 'male';
        profileController.setProfile(
          name: nameController.text.trim(),
          genderValue: selectedGender.value,
        );
        return;
      } catch (_) {}
    }

    final user = FirebaseAuth.instance.currentUser;
    nameController.text = user?.displayName ?? '';
    emailController.text = user?.email ?? '';
    phoneController.text = '';
    selectedGender.value = 'male';
    profileController.setProfile(
      name: nameController.text.trim(),
      genderValue: selectedGender.value,
    );
  }

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    super.dispose();
  }

  Future<void> _updateProfileInFirebase() async {
    final user = FirebaseAuth.instance.currentUser;
    if (user == null) throw Exception(S.current.error);

    final trimmedName = nameController.text.trim();
    await user.updateDisplayName(trimmedName);
    await user.reload();

    await FirebaseFirestore.instance
        .collection(BackendEndpoint.users)
        .doc(user.uid)
        .set({
          'name': trimmedName,
          'gender': selectedGender.value,
          'phone': phoneController.text.trim(),
        }, SetOptions(merge: true));
  }

  Future<void> _saveUserLocally() async {
    final rawUser = Prefs.getString(kUserData);
    final currentUid = FirebaseAuth.instance.currentUser?.uid ?? '';

    Map<String, dynamic> userMap = {
      'name': nameController.text.trim(),
      'email': emailController.text.trim(),
      'phone': phoneController.text.trim(),
      'gender': selectedGender.value,
      'uId': currentUid,
      'role': 'viewer',
    };

    if (rawUser.isNotEmpty) {
      try {
        final existing = jsonDecode(rawUser) as Map<String, dynamic>;
        userMap = {
          ...existing,
          'name': nameController.text.trim(),
          'email': emailController.text.trim(),
          'phone': phoneController.text.trim(),
          'gender': selectedGender.value,
        };
      } catch (_) {}
    }

    await Prefs.setString(kUserData, jsonEncode(userMap));
    profileController.setProfile(
      name: nameController.text.trim(),
      genderValue: selectedGender.value,
    );
  }

  Future<void> _onSavePressed() async {
    if (isSaving.value) return;
    final strings = S.of(context);
    if (!formKey.currentState!.validate()) {
      autovalidateMode.value = AutovalidateMode.always;
      return;
    }

    isSaving.value = true;
    try {
      await _updateProfileInFirebase();
      await _saveUserLocally();
      showSnackBar(
        strings.done,
        strings.profileSavedSuccessfully,
      );
    } catch (_) {
      showSnackBar(
        strings.error,
        strings.failedToUpdateData,
      );
    } finally {
      if (mounted) isSaving.value = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final colors = Theme.of(context).colorScheme;
      final avatarPath =
          selectedGender.value == 'female'
              ? Assets.imagesProfileImageFemale
              : Assets.imagesProfileImageMale;

      return Scaffold(
        appBar: buildAppBar(context, title: S.of(context).profile),
        body: SafeArea(
          child: Stack(
            children: [
              Form(
                key: formKey,
                autovalidateMode: autovalidateMode.value,
                child: Column(
                  children: [
                    Expanded(
                      child: SingleChildScrollView(
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          children: [
                            Container(
                              width: double.infinity,
                              padding: const EdgeInsets.all(14),
                              decoration: BoxDecoration(
                                color: colors.primary.withValues(alpha: 0.12),
                                borderRadius: BorderRadius.circular(12),
                                border: Border.all(
                                  color: colors.outline.withValues(alpha: 0.4),
                                ),
                              ),
                              child: Row(
                                children: [
                                  CircleAvatar(
                                    radius: 22,
                                    child: ClipOval(
                                      child: Image.asset(avatarPath, fit: BoxFit.cover),
                                    ),
                                  ),
                                  const SizedBox(width: 10),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          S.of(context).profileInfo,
                                          style: TextStyles.bold16.copyWith(
                                            color: colors.onSurface,
                                          ),
                                        ),
                                        const SizedBox(height: 2),
                                        Text(
                                          S.of(context).updateDataHint,
                                          style: TextStyles.regular13.copyWith(
                                            color: colors.onSurface.withValues(alpha: 0.6),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 14),
                            _LabeledField(
                              label: S.of(context).fullName,
                              child: CustomTextFormField(
                                controller: nameController,
                                hintText: S.of(context).enterFullName,
                                textInputType: TextInputType.name,
                                validator: (value) {
                                  if (value == null || value.trim().isEmpty) {
                                    return S.of(context).nameRequired;
                                  }
                                  return null;
                                },
                              ),
                            ),
                            const SizedBox(height: 10),
                            _LabeledField(
                              label: S.of(context).email,
                              child: CustomTextFormField(
                                controller: emailController,
                                hintText: S.of(context).emailExample,
                                readOnly: true,
                                textInputType: TextInputType.emailAddress,
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
                              ),
                            ),
                            const SizedBox(height: 10),
                            _LabeledField(
                              label: S.of(context).phoneNumber,
                              child: CustomTextFormField(
                                controller: phoneController,
                                hintText: S.of(context).phoneExample,
                                textInputType: TextInputType.phone,
                                validator: (value) {
                                  if (value == null || value.trim().isEmpty) {
                                    return S.of(context).phoneRequired;
                                  }
                                  if (value.trim().length < 9) {
                                    return S.of(context).phoneIncomplete;
                                  }
                                  return null;
                                },
                              ),
                            ),
                            const SizedBox(height: 14),
                            _LabeledField(
                              label: S.of(context).gender,
                              child: Row(
                                children: [
                                  Expanded(
                                    child: _GenderButton(
                                      title: S.of(context).male,
                                      selected: selectedGender.value == 'male',
                                      onTap: () => selectedGender.value = 'male',
                                    ),
                                  ),
                                  const SizedBox(width: 8),
                                  Expanded(
                                    child: _GenderButton(
                                      title: S.of(context).female,
                                      selected: selectedGender.value == 'female',
                                      onTap: () => selectedGender.value = 'female',
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(16, 32, 16, 16),
                      child: CustomBottom(
                        text: isSaving.value
                            ? S.of(context).saving
                            : S.of(context).saveChanges,
                        onPressed: _onSavePressed,
                      ),
                    ),
                  ],
                ),
              ),
              if (isSaving.value)
                Positioned.fill(
                  child: Container(
                    color: colors.scrim.withValues(alpha: 0.2),
                    alignment: Alignment.center,
                    child: CircularProgressIndicator(color: colors.primary),
                  ),
                ),
            ],
          ),
        ),
      );
    });
  }
}

class _GenderButton extends StatelessWidget {
  const _GenderButton({
    required this.title,
    required this.selected,
    required this.onTap,
  });

  final String title;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(8),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 11),
        decoration: BoxDecoration(
          color: selected
              ? colors.primary.withValues(alpha: 0.12)
              : colors.surface,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: selected
                ? colors.primary
                : colors.outline.withValues(alpha: 0.4),
          ),
        ),
        child: Center(
          child: Text(
            title,
            style: TextStyles.semiBold13.copyWith(
              color: selected
                  ? colors.primary
                  : colors.onSurface.withValues(alpha: 0.7),
            ),
          ),
        ),
      ),
    );
  }
}

class _LabeledField extends StatelessWidget {
  const _LabeledField({required this.label, required this.child});

  final String label;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyles.semiBold13.copyWith(color: colors.onSurface),
        ),
        const SizedBox(height: 6),
        child,
      ],
    );
  }
}
