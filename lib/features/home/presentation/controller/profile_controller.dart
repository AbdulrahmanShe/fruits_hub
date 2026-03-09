import 'dart:convert';

import 'package:fruits_hub/core/constants.dart';
import 'package:fruits_hub/core/services/shared_preferences_singleton.dart';
import 'package:get/get.dart';

class ProfileController extends GetxController {
  final RxString gender = 'male'.obs;
  final RxString userName = ''.obs;

  @override
  void onInit() {
    super.onInit();
    loadFromLocal();
  }

  void loadFromLocal() {
    final raw = Prefs.getString(kUserData);
    if (raw.isEmpty) {
      gender.value = 'male';
      userName.value = '';
      return;
    }

    try {
      final map = jsonDecode(raw) as Map<String, dynamic>;
      final value = (map['gender'] ?? '').toString().toLowerCase();
      gender.value = value == 'female' ? 'female' : 'male';
      userName.value = (map['name'] ?? '').toString();
    } catch (_) {
      gender.value = 'male';
      userName.value = '';
    }
  }

  void setProfile({required String name, required String genderValue}) {
    userName.value = name;
    gender.value = genderValue == 'female' ? 'female' : 'male';
  }
}
