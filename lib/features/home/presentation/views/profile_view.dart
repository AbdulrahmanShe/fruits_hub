import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fruits_hub/core/constants.dart';
import 'package:fruits_hub/core/services/shared_preferences_singleton.dart';
import 'package:fruits_hub/core/utils/app_colors.dart';
import 'package:fruits_hub/core/utils/app_images.dart';
import 'package:fruits_hub/core/utils/app_text_styles.dart';
import 'package:fruits_hub/features/home/presentation/views/about_us_view.dart';
import 'package:fruits_hub/features/home/presentation/views/help_view.dart';
import 'package:fruits_hub/features/home/presentation/views/language_view.dart';
import 'package:fruits_hub/features/home/presentation/views/orders_view.dart';
import 'package:fruits_hub/features/home/presentation/views/profile_info_view.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  static const String notificationsEnabledKey = 'notificationsEnabled';
  static const String designModeEnabledKey = 'designModeEnabled';

  _UserData userData = const _UserData(name: '', email: '');
  bool notificationsEnabled = true;
  bool designModeEnabled = false;

  @override
  void initState() {
    super.initState();
    _readUserData();
    _readSettings();
  }

  void _readUserData() {
    final raw = Prefs.getString(kUserData);
    if (raw.isEmpty) return;

    try {
      final map = jsonDecode(raw) as Map<String, dynamic>;
      if (!mounted) return;
      setState(() {
        userData = _UserData(
          name: (map['name'] ?? '').toString(),
          email: (map['email'] ?? '').toString(),
        );
      });
    } catch (_) {}
  }

  void _readSettings() {
    notificationsEnabled = Prefs.getBool(notificationsEnabledKey);
    designModeEnabled = Prefs.getBool(designModeEnabledKey);
  }

  void _onNotificationsChanged(bool value) {
    setState(() => notificationsEnabled = value);
    Prefs.setBool(notificationsEnabledKey, value);
  }

  void _onDesignModeChanged(bool value) {
    setState(() => designModeEnabled = value);
    Prefs.setBool(designModeEnabledKey, value);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            _ProfileHeader(
              name: userData.name.isEmpty ? 'مستخدم' : userData.name,
              email: userData.email,
            ),
            const SizedBox(height: 14),
            _ProfileActionTile(
              icon: Icons.person_outline,
              title: 'الملف الشخصي',
              onTap: () async {
                await Navigator.of(context).push(
                  MaterialPageRoute<void>(
                    builder: (_) => const ProfileInfoView(),
                  ),
                );
                _readUserData();
              },
            ),
            _ProfileActionTile(
              icon: Icons.receipt_long_outlined,
              title: 'طلباتي',
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute<void>(
                    builder: (_) => const OrdersView(),
                  ),
                );
              },
            ),
            _ProfileActionTile(
              icon: Icons.translate_outlined,
              title: 'اللغة',
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute<void>(
                    builder: (_) => const LanguageView(),
                  ),
                );
              },
            ),
            _ProfileSwitchTile(
              icon: Icons.notifications_none_outlined,
              title: 'الإشعارات',
              value: notificationsEnabled,
              onChanged: _onNotificationsChanged,
            ),
            _ProfileSwitchTile(
              icon: Icons.dark_mode_outlined,
              title: 'الوضع',
              value: designModeEnabled,
              onChanged: _onDesignModeChanged,
            ),
            _ProfileActionTile(
              icon: Icons.help_outline,
              title: 'المساعدة',
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute<void>(
                    builder: (_) => const HelpView(),
                  ),
                );
              },
            ),
            _ProfileActionTile(
              icon: Icons.info_outline,
              title: 'من نحن',
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute<void>(
                    builder: (_) => const AboutUsView(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class _ProfileHeader extends StatelessWidget {
  const _ProfileHeader({
    required this.name,
    required this.email,
  });

  final String name;
  final String email;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: const Color(0xFFF1F7F3),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xFFDFECE4)),
      ),
      child: Row(
        children: [
          ClipOval(
            child: Image.asset(
              Assets.imagesProfileImage,
              width: 56,
              height: 56,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(name, style: TextStyles.bold16),
                const SizedBox(height: 4),
                Text(
                  email.isEmpty ? 'لا يوجد بريد إلكتروني' : email,
                  style: TextStyles.regular13.copyWith(
                    color: const Color(0xFF5F6967),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _ProfileActionTile extends StatelessWidget {
  const _ProfileActionTile({
    required this.icon,
    required this.title,
    required this.onTap,
  });

  final IconData icon;
  final String title;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: const Color(0xFFE4E9E6)),
      ),
      child: ListTile(
        leading: Icon(icon, color: AppColors.primaryColor),
        title: Text(title, style: TextStyles.semiBold13),
        trailing: const Icon(Icons.arrow_forward_ios, size: 16),
        onTap: onTap,
      ),
    );
  }
}

class _ProfileSwitchTile extends StatelessWidget {
  const _ProfileSwitchTile({
    required this.icon,
    required this.title,
    required this.value,
    required this.onChanged,
  });

  final IconData icon;
  final String title;
  final bool value;
  final ValueChanged<bool> onChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: const Color(0xFFE4E9E6)),
      ),
      child: ListTile(
        leading: Icon(icon, color: AppColors.primaryColor),
        title: Text(title, style: TextStyles.semiBold13),
        trailing: Switch(
          value: value,
          onChanged: onChanged,
          activeColor: AppColors.primaryColor,
        ),
      ),
    );
  }
}

class _UserData {
  const _UserData({
    required this.name,
    required this.email,
  });

  final String name;
  final String email;
}
