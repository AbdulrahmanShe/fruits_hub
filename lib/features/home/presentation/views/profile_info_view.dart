import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fruits_hub/core/constants.dart';
import 'package:fruits_hub/core/services/shared_preferences_singleton.dart';
import 'package:fruits_hub/core/utils/app_colors.dart';
import 'package:fruits_hub/core/utils/app_text_styles.dart';
import 'package:fruits_hub/core/utils/backend_endpoint.dart';
import 'package:fruits_hub/core/widgets/custom_app_bar.dart';
import 'package:fruits_hub/core/widgets/custom_bottom.dart';
import 'package:fruits_hub/core/widgets/custom_text_form_field.dart';
import 'package:get/get.dart';
import 'package:svg_flutter/svg.dart';

class ProfileInfoView extends StatefulWidget {
  const ProfileInfoView({super.key});

  static const routeName = '/profileInfoView';

  @override
  State<ProfileInfoView> createState() => _ProfileInfoViewState();
}

class _ProfileInfoViewState extends State<ProfileInfoView> {
  static const String maleAvatarPath = 'assets/images/avatar_male_cartoon.svg';
  static const String femaleAvatarPath = 'assets/images/avatar_female_cartoon.svg';

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();

  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  bool isSaving = false;
  String selectedGender = 'male';

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
        selectedGender = (gender == 'female') ? 'female' : 'male';
        return;
      } catch (_) {}
    }

    final user = FirebaseAuth.instance.currentUser;
    nameController.text = user?.displayName ?? '';
    emailController.text = user?.email ?? '';
    phoneController.text = '';
    selectedGender = 'male';
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
    if (user == null) {
      throw Exception('User not logged in');
    }

    final trimmedName = nameController.text.trim();

    await user.updateDisplayName(trimmedName);
    await user.reload();

    await FirebaseFirestore.instance
        .collection(BackendEndpoint.users)
        .doc(user.uid)
        .set({
          'name': trimmedName,
          'gender': selectedGender,
        }, SetOptions(merge: true));
  }

  Future<void> _saveUserLocally() async {
    final rawUser = Prefs.getString(kUserData);
    final currentUid = FirebaseAuth.instance.currentUser?.uid ?? '';

    Map<String, dynamic> userMap = {
      'name': nameController.text.trim(),
      'email': emailController.text.trim(),
      'phone': phoneController.text.trim(),
      'gender': selectedGender,
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
          'gender': selectedGender,
        };
      } catch (_) {}
    }

    await Prefs.setString(kUserData, jsonEncode(userMap));
  }

  Future<void> _onSavePressed() async {
    if (isSaving) return;
    if (!formKey.currentState!.validate()) {
      setState(() => autovalidateMode = AutovalidateMode.always);
      return;
    }

    setState(() => isSaving = true);
    try {
      await _updateProfileInFirebase();
      await _saveUserLocally();
      Get.snackbar(
        'تم',
        'تم حفظ البيانات بنجاح',
        snackPosition: SnackPosition.BOTTOM,
      );
    } catch (_) {
      Get.snackbar(
        'خطأ',
        'تعذر تحديث البيانات',
        snackPosition: SnackPosition.BOTTOM,
      );
    } finally {
      if (mounted) {
        setState(() => isSaving = false);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final avatarPath = selectedGender == 'female' ? femaleAvatarPath : maleAvatarPath;

    return Scaffold(
      appBar: buildAppBar(context, title: 'الملف الشخصي'),
      body: SafeArea(
        child: Stack(
          children: [
            Form(
              key: formKey,
              autovalidateMode: autovalidateMode,
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
                                    color: const Color(0xFFF1F7F3),
                                    borderRadius: BorderRadius.circular(12),
                                    border: Border.all(
                                      color: const Color(0xFFDFECE4),
                                    ),
                                  ),
                                  child: Row(
                                    children: [
                                      CircleAvatar(
                                        radius: 22,
                                        backgroundColor: AppColors.primaryColor
                                            .withOpacity(.12),
                                        child: SvgPicture.asset(avatarPath, fit: BoxFit.cover),
                                      ),
                                      const SizedBox(width: 10),
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              'معلومات الحساب',
                                              style: TextStyles.bold16,
                                            ),
                                            const SizedBox(height: 2),
                                            Text(
                                              'حدّث بياناتك وسيتم حفظها محليًا.',
                                              style: TextStyles.regular13.copyWith(
                                                color: const Color(0xFF5A6662),
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
                            label: 'الاسم الكامل',
                            child: CustomTextFormField(
                              controller: nameController,
                              hintText: 'أدخل الاسم الكامل',
                              textInputType: TextInputType.name,
                              validator: (value) {
                                if (value == null || value.trim().isEmpty) {
                                  return 'الاسم مطلوب';
                                }
                                return null;
                              },
                            ),
                          ),
                          const SizedBox(height: 10),
                          _LabeledField(
                            label: 'البريد الإلكتروني',
                            child: CustomTextFormField(
                              controller: emailController,
                              hintText: 'mail@example.com',
                              textInputType: TextInputType.emailAddress,
                              validator: (value) {
                                if (value == null || value.trim().isEmpty) {
                                  return 'البريد الإلكتروني مطلوب';
                                }
                                final emailRegex = RegExp(
                                  r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
                                );
                                if (!emailRegex.hasMatch(value.trim())) {
                                  return 'صيغة البريد الإلكتروني غير صحيحة';
                                }
                                return null;
                              },
                            ),
                          ),
                          const SizedBox(height: 10),
                          _LabeledField(
                            label: 'رقم الهاتف',
                            child: CustomTextFormField(
                              controller: phoneController,
                              hintText: '05x xxx xxxx',
                              textInputType: TextInputType.phone,
                              validator: (value) {
                                if (value == null || value.trim().isEmpty) {
                                  return 'رقم الهاتف مطلوب';
                                }
                                if (value.trim().length < 9) {
                                  return 'رقم الهاتف غير مكتمل';
                                }
                                return null;
                              },
                            ),
                          ),
                    const SizedBox(height: 14),
                    _LabeledField(
                            label: 'الجنس',
                            child: Row(
                      children: [
                        Expanded(
                          child: _GenderButton(
                            title: 'ذكر',
                            selected: selectedGender == 'male',
                            onTap: () {
                              setState(() => selectedGender = 'male');
                            },
                          ),
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          child: _GenderButton(
                            title: 'أنثى',
                            selected: selectedGender == 'female',
                            onTap: () {
                              setState(() => selectedGender = 'female');
                            },
                          ),
                        ),
                      ],
                    ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(16, 32, 16, 16),
                      child: CustomBottom(
                        text: isSaving ? 'جاري الحفظ...' : 'حفظ التغييرات',
                        onPressed: _onSavePressed,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            if (isSaving)
              Positioned.fill(
                child: Container(
                  color: Colors.black.withOpacity(0.08),
                  alignment: Alignment.center,
                  child: const CircularProgressIndicator(
                    color: AppColors.primaryColor,
                  ),
                ),
              ),
          ],
        ),
      ),
          ],
          ),
          ),
    );
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
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(8),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 11),
        decoration: BoxDecoration(
          color: selected ? const Color(0xFFEFF7F2) : const Color(0xFFF9FAFA),
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: selected ? AppColors.primaryColor : const Color(0xFFE1E4E3),
          ),
        ),
        child: Center(
          child: Text(
            title,
            style: TextStyles.semiBold13.copyWith(
              color: selected ? AppColors.primaryColor : const Color(0xFF596260),
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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyles.semiBold13.copyWith(color: const Color(0xFF45504D)),
        ),
        const SizedBox(height: 6),
        child,
      ],
    );
    }
    }
