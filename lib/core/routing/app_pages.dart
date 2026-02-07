import 'package:fruits_hub/core/bindings/products_binding.dart';
import 'package:fruits_hub/features/auth/presentation/views/widgets/forgot_password_view.dart';
import 'package:fruits_hub/features/auth/presentation/views/widgets/terms_and_conditions_view.dart';
import 'package:fruits_hub/features/checkout/binding/checkout_binding%20.dart';
import 'package:fruits_hub/features/checkout/presentation/views/checkout_view.dart';
import 'package:fruits_hub/features/home/bindings/favorit_binding.dart';
import 'package:fruits_hub/features/home/presentation/views/main_view.dart';
import 'package:fruits_hub/features/home/presentation/views/widgets/featured_view.dart';
import 'package:fruits_hub/features/home/presentation/views/widgets/favorit_view.dart';
import 'package:fruits_hub/features/home/presentation/views/widgets/product_details_view.dart';
import 'package:fruits_hub/features/search/presentation/views/search_view.dart';
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
  name: MainView.routeName,
  page: () => const MainView(),
  bindings: [
    ProductsBinding(),
    FavoritBinding(), // ✅ هنا الحل
  ],
),

    GetPage(
  name: SearchView.routeName,
  page: () => const SearchView(),
),

    GetPage(
    name: ProductDetailsView.routeName,
    page: () => const ProductDetailsView(),
    ),

    GetPage(
      name: FavoritView.routeName, 
      page: () => const FavoritView(),
      binding: FavoritBinding(),
      ),

    GetPage(
      name: CheckoutView.routeName,
      page: () => const CheckoutView(),
      binding: CheckoutBinding(),
    ),

    GetPage(
      name: FeaturedView.routeName,
      page: () => const FeaturedView(),
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
