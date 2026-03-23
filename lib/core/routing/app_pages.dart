import 'package:fruits_hub/core/bindings/products_binding.dart';
import 'package:fruits_hub/features/auth/bindings/auth_binding.dart';
import 'package:fruits_hub/features/auth/presentation/views/sign_in_view.dart';
import 'package:fruits_hub/features/auth/presentation/views/sign_up_view.dart';
import 'package:fruits_hub/features/auth/presentation/views/widgets/forgot_password_view.dart';
import 'package:fruits_hub/features/auth/presentation/views/widgets/terms_and_conditions_view.dart';
import 'package:fruits_hub/features/checkout/binding/checkout_binding.dart';
import 'package:fruits_hub/features/checkout/presentation/views/checkout_view.dart';
import 'package:fruits_hub/features/checkout/presentation/views/payment_success_view.dart';
import 'package:fruits_hub/features/home/bindings/favorit_binding.dart';
import 'package:fruits_hub/features/home/bindings/main_binding.dart';
import 'package:fruits_hub/features/home/bindings/orders_binding.dart';
import 'package:fruits_hub/features/home/presentation/views/about_us_view.dart';
import 'package:fruits_hub/features/home/presentation/views/help_view.dart';
import 'package:fruits_hub/features/home/presentation/views/language_view.dart';
import 'package:fruits_hub/features/home/presentation/views/main_view.dart';
import 'package:fruits_hub/features/home/presentation/views/orders_view.dart';
import 'package:fruits_hub/features/home/presentation/views/profile_info_view.dart';
import 'package:fruits_hub/features/home/presentation/views/widgets/featured_view.dart';
import 'package:fruits_hub/features/home/presentation/views/widgets/favorit_view.dart';
import 'package:fruits_hub/features/home/presentation/views/widgets/product_details_view.dart';
import 'package:fruits_hub/features/on_boarding/presentation/views/on_boarding_view.dart';
import 'package:fruits_hub/features/search/presentation/views/search_view.dart';
import 'package:fruits_hub/features/splash/presentation/views/splash_view.dart';
import 'package:get/get.dart';

class AppPages {
  static final routes = [
    GetPage(name: SplashView.routeName, page: () => const SplashView()),
    GetPage(
      name: SignInView.routeName,
      page: () => const SignInView(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: SignUpView.routeName,
      page: () => const SignUpView(),
      binding: AuthBinding(),
    ),
    GetPage(name: OnBoardingView.routeName, page: () => const OnBoardingView()),
    GetPage(
      name: MainView.routeName,
      page: () => const MainView(),
      bindings: [MainBinding(), ProductsBinding(), FavoritBinding()],
    ),
    GetPage(
      name: SearchView.routeName,
      page: () => const SearchView(),
      binding: ProductsBinding(),
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
      name: PaymentSuccessView.routeName,
      page: () => const PaymentSuccessView(),
    ),
    GetPage(name: FeaturedView.routeName, page: () => const FeaturedView()),
    GetPage(
      name: TermsAndConditionsView.routeName,
      page: () => const TermsAndConditionsView(),
    ),
    GetPage(
      name: ForgotPasswordView.routeName,
      page: () => const ForgotPasswordView(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: ProfileInfoView.routeName,
      page: () => const ProfileInfoView(),
    ),
    GetPage(
      name: OrdersView.routeName,
      page: () => const OrdersView(),
      binding: OrdersBinding(),
    ),
    GetPage(name: HelpView.routeName, page: () => const HelpView()),
    GetPage(name: AboutUsView.routeName, page: () => const AboutUsView()),
    GetPage(name: LanguageView.routeName, page: () => const LanguageView()),
  ];
}
