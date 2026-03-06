import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:fruits_hub/core/bindings/global_binding.dart';
import 'package:fruits_hub/core/constants.dart';
import 'package:fruits_hub/core/services/shared_preferences_singleton.dart';
import 'package:fruits_hub/features/splash/presentation/views/splash_view.dart';
import 'package:fruits_hub/core/utils/app_colors.dart';
import 'package:fruits_hub/firebase_options.dart';
import 'generated/l10n.dart';
import 'package:get/get.dart';
import 'package:fruits_hub/core/routing/app_pages.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await Prefs.init();
  runApp(const FruitHub());
}

class FruitHub extends StatelessWidget {
  const FruitHub({super.key});

  @override
  Widget build(BuildContext context) {
    final savedLanguage = Prefs.getString(kAppLanguage);
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialBinding: GlobalBinding(),

      // 🎨 Theme
      theme: ThemeData(
        fontFamily: 'Cairo',
        scaffoldBackgroundColor: Colors.white,
        colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primaryColor),
      ),

      // 🌍 Localization (كما هي)
      localizationsDelegates: [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: S.delegate.supportedLocales,
      locale: Locale(savedLanguage.isEmpty ? 'ar' : savedLanguage),

      // 🚦 GetX Routing
      getPages: AppPages.routes,
      initialRoute: SplashView.routeName,
    );
  }
}

// Folow
// UI ,
// Entity ,
//Repo , Repo Imp ,
//DatabaseServices , FirebaseServices ,
//Controller ,
//Finish Logic,
//Finish Featuers
