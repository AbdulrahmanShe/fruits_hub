import 'package:fruits_hub/features/auth/presentation/views/widgets/forgot_password_view.dart';
import 'package:fruits_hub/features/auth/presentation/views/widgets/terms_and_conditions_view.dart';
import 'package:fruits_hub/features/home/presentation/views/home_view.dart';
import 'package:get/get.dart';
import 'package:fruits_hub/features/auth/bindings/auth_binding.dart';
import 'package:fruits_hub/features/auth/presentation/views/sign_in_view.dart';
import 'package:fruits_hub/features/auth/presentation/views/sign_up_view.dart';
import 'package:fruits_hub/features/on_boarding/presentation/views/on_boarding_view.dart';
import 'package:fruits_hub/features/splash/presentation/views/splash_view.dart';

class AppPages {
  static final routes = [
    GetPage(
      name: SplashView.routeName,
      page: () => const SplashView(),
    ),

    GetPage(
      name: SignInView.routeName,
      page: () => const SignInView(),
      binding: AuthBinding(), // 👈 هنا السحر
    ),

    GetPage(
      name: SignUpView.routeName,
      page: () => const SignUpView(),
      binding: AuthBinding(), // 👈 وهنا
    ),

    GetPage(
      name: OnBoardingView.routeName,
      page: () => const OnBoardingView(),
    ),

    GetPage(
      name: HomeView.routeName,
      page: () => const HomeView(),
    ),

    GetPage(
  name: TermsAndConditionsView.routeName,
  page: () => const TermsAndConditionsView(),
),

    GetPage(
      name: ForgotPasswordView.routeName, 
      page: () => const ForgotPasswordView(),
      binding: AuthBinding(),
      ),

   


  ];
}
