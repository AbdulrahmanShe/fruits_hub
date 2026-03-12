import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fruits_hub/core/constants.dart';
import 'package:fruits_hub/core/services/shared_preferences_singleton.dart';
import 'package:fruits_hub/core/utils/app_images.dart';
import 'package:fruits_hub/core/widgets/custom_app_bar.dart';
import 'package:fruits_hub/features/auth/presentation/views/sign_in_view.dart';
import 'package:fruits_hub/features/home/presentation/controller/profile_controller.dart';
import 'package:fruits_hub/features/home/presentation/views/about_us_view.dart';
import 'package:fruits_hub/features/home/presentation/views/help_view.dart';
import 'package:fruits_hub/features/home/presentation/views/language_view.dart';
import 'package:fruits_hub/features/home/presentation/views/orders_view.dart';
import 'package:fruits_hub/features/home/presentation/views/profile_info_view.dart';
import 'package:fruits_hub/features/home/presentation/views/widgets/favorit_view.dart';
import 'package:fruits_hub/generated/l10n.dart';
import 'package:get/get.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  static const String notificationsEnabledKey = 'notificationsEnabled';
  final ProfileController profileController = Get.find<ProfileController>();

  _UserData userData = const _UserData(name: '', email: '');
  bool notificationsEnabled = true;
  bool designModeEnabled = false;

  @override
  void initState() {
    super.initState();
    _readUserData();
    _readSettings();
    profileController.loadFromLocal();
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
    designModeEnabled = Prefs.getBool(kAppDarkMode);
  }

  void _onNotificationsChanged(bool value) {
    setState(() => notificationsEnabled = value);
    Prefs.setBool(notificationsEnabledKey, value);
  }

  void _onDesignModeChanged(bool value) {
    setState(() => designModeEnabled = value);
    Prefs.setBool(kAppDarkMode, value);
    Get.changeThemeMode(value ? ThemeMode.dark : ThemeMode.light);
  }

  Future<void> _logout() async {
    await FirebaseAuth.instance.signOut();
    Get.offAllNamed(SignInView.routeName);
  }

  Future<void> _confirmLogout() async {
    final strings = S.of(context);
    final shouldLogout = await showDialog<bool>(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(strings.confirmLogoutTitle),
          content: Text(strings.confirmLogoutMessage),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(false),
              child: Text(strings.cancel),
            ),
            TextButton(
              onPressed: () => Navigator.of(context).pop(true),
              child: Text(strings.confirm),
            ),
          ],
        );
      },
    );
    if (shouldLogout == true) {
      await _logout();
    }
  }

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final isRtl = Directionality.of(context) == TextDirection.rtl;
    final name = userData.name.isEmpty ? 'abed' : userData.name;
    final email =
        userData.email.isEmpty ? 'abed2003shehab@gmail.com' : userData.email;
    final languageValue =
        Prefs.getString(kAppLanguage) == 'en'
            ? S.of(context).english
            : S.of(context).arabic;

    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: buildAppBar(
        context,
        title: S.of(context).myAccount,
        showBackBottom: false,
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.all(24),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          _ProfileTop(name: name, email: email),
                          const SizedBox(height: 28),
                          Align(
                            alignment:
                                isRtl ? Alignment.centerRight : Alignment.centerLeft,
                            child: Text(
                              S.of(context).general,
                              style: TextStyle(
                                color: colors.onSurface,
                                fontSize: 13,
                                fontWeight: FontWeight.w600,
                              ),
                              textAlign: isRtl ? TextAlign.right : TextAlign.left,
                            ),
                          ),
                          const SizedBox(height: 8),
                          _ProfileLineItem(
                            title: S.of(context).profile,
                            icon: Icons.person_outline,
                            onTap: () async {
                              await Navigator.of(context).push(
                                MaterialPageRoute<void>(
                                  builder: (_) => const ProfileInfoView(),
                                ),
                              );
                              _readUserData();
                            },
                          ),
                          const SizedBox(height: 8),
                          _ProfileLineItem(
                            title: S.of(context).myOrders,
                            icon: Icons.inventory_2_outlined,
                            onTap: () {
                              Navigator.of(context).push(
                                MaterialPageRoute<void>(
                                  builder: (_) => const OrdersView(),
                                ),
                              );
                            },
                          ),
                          const SizedBox(height: 8),
                          _ProfileLineItem(
                            title: S.of(context).favorites,
                            icon: Icons.favorite_border,
                            onTap: () {
                              Navigator.of(context).push(
                                MaterialPageRoute<void>(
                                  builder: (_) => const FavoritView(),
                                ),
                              );
                            },
                          ),
                          const SizedBox(height: 8),
                          _ProfileLineItem(
                            title: S.of(context).notifications,
                            icon: Icons.notifications_none,
                            trailing: _StyledSwitch(
                              value: notificationsEnabled,
                              onChanged: _onNotificationsChanged,
                            ),
                            onTap: null,
                          ),
                          const SizedBox(height: 8),
                          _ProfileLineItem(
                            title: S.of(context).language,
                            icon: Icons.language,
                            trailing: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  languageValue,
                                  style:  TextStyle(
                                    color: colors.primary,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                const SizedBox(width: 8),
                                Icon(
                                  Icons.arrow_forward_ios,
                                  size: 15,
                                  color: colors.onSurface,
                                ),
                              ],
                            ),
                            onTap: () async {
                              await Navigator.of(context).push(
                                MaterialPageRoute<void>(
                                  builder: (_) => const LanguageView(),
                                ),
                              );
                              if (mounted) {
                                setState(() {});
                              }
                            },
                          ),
                          const SizedBox(height: 8),
                          _ProfileLineItem(
                            title: S.of(context).designMode,
                            icon: Icons.auto_fix_high_outlined,
                            trailing: _StyledSwitch(
                              value: designModeEnabled,
                              onChanged: _onDesignModeChanged,
                            ),
                            onTap: null,
                          ),
                          const SizedBox(height: 14),
                          Align(
                            alignment:
                                isRtl ? Alignment.centerRight : Alignment.centerLeft,
                            child: Text(
                              S.of(context).helpSection,
                              style: TextStyle(
                                color: colors.onSurface,
                                fontSize: 13,
                                fontWeight: FontWeight.w600,
                              ),
                              textAlign: isRtl ? TextAlign.right : TextAlign.left,
                            ),
                          ),
                          const SizedBox(height: 8),
                          _ProfileLineItem(
                            title: S.of(context).aboutUs,
                            icon: Icons.info_outline,
                            onTap: () {
                              Navigator.of(context).push(
                                MaterialPageRoute<void>(
                                  builder: (_) => const AboutUsView(),
                                ),
                              );
                            },
                          ),
                          const SizedBox(height: 8),
                          _ProfileLineItem(
                            title: S.of(context).help,
                            icon: Icons.help_outline,
                            onTap: () {
                              Navigator.of(context).push(
                                MaterialPageRoute<void>(
                                  builder: (_) => const HelpView(),
                                ),
                              );
                            },
                          ),
                           
                        ],
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: _confirmLogout,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                      children: [
                        const SizedBox(width: 24),
                        Expanded(
                          child: Center(
                            child: Text(
                              S.of(context).logout,
                              style: TextStyle(
                                color: colors.primary,
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                        Icon(
                          Icons.logout,
                          color: colors.primary,
                          size: 25,
                        ),
                        const SizedBox(width: 22),
                      ],
                    ),
                  ),
                ),
          ],
        ),
           
         
      ),
    );
  }
}

class _ProfileTop extends StatelessWidget {
  const _ProfileTop({required this.name, required this.email});

  final String name;
  final String email;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final profileController = Get.find<ProfileController>();

    return Obx(() {
      final avatarPath =
          profileController.gender.value == 'female'
              ? Assets.imagesProfileImageFemale
              : Assets.imagesProfileImageMale;
      final displayName =
          profileController.userName.value.isEmpty
              ? name
              : profileController.userName.value;

      return Row(
        children: [
          ClipOval(
            child: Image.asset(
              avatarPath,
              width: 80,
              height: 80,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 22),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  displayName,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: colors.onSurface,
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  email,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: colors.onSurface.withValues(alpha: 0.6),
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),
        ],
      );
    });
  }
}

class _ProfileLineItem extends StatelessWidget {
  const _ProfileLineItem({
    required this.title,
    required this.icon,
    required this.onTap,
    this.trailing,
  });

  final String title;
  final IconData icon;
  final VoidCallback? onTap;
  final Widget? trailing;

  @override
  Widget build(BuildContext context) {
    final isClickable = onTap != null;
    final theme = Theme.of(context);
    final colors = theme.colorScheme;

    return InkWell(
      onTap: onTap,
      child: Container(
        height: 36,
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(color: theme.dividerColor, width: 1.1),
          ),
        ),
        child: Row(
          children: [
            Icon(icon, size: 25, color: colors.primary),
            const SizedBox(width: 14),
            Expanded(
              child: Text(
                title,
                style: TextStyle(
                  color: colors.onSurface.withValues(alpha: 0.7),
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            if (trailing != null)
              trailing!
            else if (isClickable)
              Icon(
                Icons.arrow_forward_ios,
                size: 15,
                color: colors.onSurface.withValues(alpha: 0.7),
              )
            else
              const SizedBox(width: 24),
          ],
        ),
      ),
    );
  }
}

class _StyledSwitch extends StatelessWidget {
  const _StyledSwitch({required this.value, required this.onChanged});

  final bool value;
  final ValueChanged<bool> onChanged;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return Transform.scale(
      scale: 0.7,
      child: Switch(
        value: value,
        onChanged: onChanged,
        activeThumbColor: colors.primary,
        activeTrackColor: colors.primary.withValues(alpha: 0.4),
        inactiveThumbColor: colors.surface,
        inactiveTrackColor: colors.outline.withValues(alpha: 0.4),
      ),
    );
  }
}

class _UserData {
  const _UserData({required this.name, required this.email});

  final String name;
  final String email;
}
