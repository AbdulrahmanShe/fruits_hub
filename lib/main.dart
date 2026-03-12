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
    final isDarkMode = Prefs.getBool(kAppDarkMode);
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialBinding: GlobalBinding(),

      // Theme
      theme: ThemeData(
        fontFamily: 'Cairo',
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: AppColors.primaryColor,
          brightness: Brightness.light,
          background: const Color(0xFFF7F8F6),
          surface: Colors.white,
        ),
        scaffoldBackgroundColor: const Color(0xFFF7F8F6),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFFF7F8F6),
          foregroundColor: Color(0xFF121212),
          elevation: 0,
          centerTitle: true,
        ),
        cardTheme: CardThemeData(
          color: Colors.white,
          elevation: 1,
          shadowColor: Colors.black.withValues(alpha: 0.06),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        dividerTheme: const DividerThemeData(
          color: Color(0xFFE3E6E5),
          thickness: 1,
          space: 16,
        ),
        iconTheme: const IconThemeData(color: Color(0xFF2B2F2E)),
        textTheme: const TextTheme(
          titleLarge: TextStyle(color: Color(0xFF121212), fontWeight: FontWeight.w700),
          titleMedium: TextStyle(color: Color(0xFF1C1D1D), fontWeight: FontWeight.w600),
          bodyLarge: TextStyle(color: Color(0xFF1C1D1D)),
          bodyMedium: TextStyle(color: Color(0xFF3B4240)),
          bodySmall: TextStyle(color: Color(0xFF6B7371)),
        ),
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: Colors.white,
          hintStyle: const TextStyle(color: Color(0xFF9AA3A1)),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: Color(0xFFE6E9E9)),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: Color(0xFFE6E9E9)),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: AppColors.primaryColor, width: 1.2),
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.primaryColor,
            foregroundColor: Colors.white,
            padding: const EdgeInsets.symmetric(vertical: 14),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
        ),
        textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
            foregroundColor: AppColors.primaryColor,
          ),
        ),
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          backgroundColor: Colors.white,
          selectedItemColor: AppColors.primaryColor,
          unselectedItemColor: Color(0xFF8B9492),
          type: BottomNavigationBarType.fixed,
          elevation: 8,
        ),
        dialogTheme: DialogThemeData(
          backgroundColor: Colors.white,
          surfaceTintColor: Colors.white,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
        ),
      ),
      darkTheme: ThemeData(
        fontFamily: 'Cairo',
        useMaterial3: true,
        brightness: Brightness.dark,
        colorScheme: ColorScheme.fromSeed(
          seedColor: AppColors.primaryColor,
          brightness: Brightness.dark,
          background: const Color(0xFF121212),
          surface: const Color(0xFF1B1F1D),
        ),
        scaffoldBackgroundColor: const Color(0xFF121212),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF121212),
          foregroundColor: Colors.white,
          elevation: 0,
          centerTitle: true,
        ),
        cardTheme: CardThemeData(
          color: const Color(0xFF1B1F1D),
          elevation: 1,
          shadowColor: Colors.black.withValues(alpha: 0.3),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        dividerTheme: const DividerThemeData(
          color: Color(0xFF2A2F2D),
          thickness: 1,
          space: 16,
        ),
        iconTheme: const IconThemeData(color: Color(0xFFE6ECEA)),
        textTheme: const TextTheme(
          titleLarge: TextStyle(color: Color(0xFFF2F5F4), fontWeight: FontWeight.w700),
          titleMedium: TextStyle(color: Color(0xFFE6ECEA), fontWeight: FontWeight.w600),
          bodyLarge: TextStyle(color: Color(0xFFE6ECEA)),
          bodyMedium: TextStyle(color: Color(0xFFBAC3C0)),
          bodySmall: TextStyle(color: Color(0xFF98A3A0)),
        ),
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: const Color(0xFF1B1F1D),
          hintStyle: const TextStyle(color: Color(0xFF98A3A0)),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: Color(0xFF2A2F2D)),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: Color(0xFF2A2F2D)),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: AppColors.primaryColor, width: 1.2),
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.primaryColor,
            foregroundColor: Colors.white,
            padding: const EdgeInsets.symmetric(vertical: 14),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
        ),
        textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
            foregroundColor: const Color(0xFF7ED39E),
          ),
        ),
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          backgroundColor: Color(0xFF1B1F1D),
          selectedItemColor: Color(0xFF7ED39E),
          unselectedItemColor: Color(0xFF8B9492),
          type: BottomNavigationBarType.fixed,
          elevation: 8,
        ),
        dialogTheme: DialogThemeData(
          backgroundColor: const Color(0xFF1B1F1D),
          surfaceTintColor: const Color(0xFF1B1F1D),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
        ),
      ),
      themeMode: isDarkMode ? ThemeMode.dark : ThemeMode.light,

      // Localization
      localizationsDelegates: [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: S.delegate.supportedLocales,
      locale: Locale(savedLanguage.isEmpty ? 'ar' : savedLanguage),

      // GetX Routing
      getPages: AppPages.routes,
      initialRoute: SplashView.routeName,
    );
  }
}

// Follow
// UI ,
// Entity ,
//Repo , Repo Imp ,
//DatabaseServices , FirebaseServices ,
//Controller ,
//Finish Logic,
// Finish Features

