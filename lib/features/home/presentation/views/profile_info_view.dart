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

class ProfileInfoView extends StatefulWidget {
  const ProfileInfoView({super.key});

  static const routeName = '/profileInfoView';

  @override
  State<ProfileInfoView> createState() => _ProfileInfoViewState();
}

class _ProfileInfoViewState extends State<ProfileInfoView> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();

  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  bool isSaving = false;

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
        return;
      } catch (_) {}
    }

    final user = FirebaseAuth.instance.currentUser;
    nameController.text = user?.displayName ?? '';
    emailController.text = user?.email ?? '';
    phoneController.text = '';
  }

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    super.dispose();
  }

  Future<void> _updateNameInFirebase() async {
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
        .set({'name': trimmedName}, SetOptions(merge: true));
  }

  Future<void> _saveUserLocally() async {
    final rawUser = Prefs.getString(kUserData);
    final currentUid = FirebaseAuth.instance.currentUser?.uid ?? '';

    Map<String, dynamic> userMap = {
      'name': nameController.text.trim(),
      'email': emailController.text.trim(),
      'phone': phoneController.text.trim(),
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
      await _updateNameInFirebase();
      await _saveUserLocally();
      Get.snackbar(
        'تم',
        'تم حفظ البيانات بنجاح',
        snackPosition: SnackPosition.BOTTOM,
      );
    } catch (_) {
      Get.snackbar(
        'خطأ',
        'تعذر تحديث الاسم في Firebase',
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
                                  child: const Icon(
                                    Icons.person_outline,
                                    color: AppColors.primaryColor,
                                  ),
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
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(16, 8, 16, 16),
                    child: CustomBottom(
                      text: isSaving ? 'جاري الحفظ...' : 'حفظ التغييرات',
                      onPressed: _onSavePressed,
                    ),
                  ),
                ],
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
