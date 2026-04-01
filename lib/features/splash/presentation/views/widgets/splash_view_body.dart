import 'package:flutter/material.dart';
import 'package:fruits_hub/core/constants.dart';
import 'package:fruits_hub/core/services/firebase_auth_service.dart';
import 'package:fruits_hub/core/services/shared_preferences_singleton.dart';
import 'package:fruits_hub/core/utils/app_images.dart';
import 'package:fruits_hub/features/auth/presentation/views/sign_in_view.dart';
import 'package:fruits_hub/features/home/presentation/views/main_view.dart';
import 'package:fruits_hub/features/on_boarding/presentation/views/on_boarding_view.dart';
import 'package:svg_flutter/svg.dart';
import 'package:get/get.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody> {

@override
  void initState() {
    super.initState();
    executeNavigation();
    
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Spacer(),
          const SizedBox(height: 100),
          Center(
            child: Image.asset(
              Assets.imagesLogo,
              width: screenWidth * 0.80,
              fit: BoxFit.contain,
            ),
          ),
          const Spacer(),
          SvgPicture.asset(
            Assets.imagesSplashBottom,
            fit: BoxFit.fill,
          ),
        ],
      ),
    );
  }

  void executeNavigation() {
    bool  isOnBoardingViewSeen = Prefs.getBool(kIsOnBoardingViewSeen);
    Future.delayed(const Duration(seconds: 3),(){
      if (isOnBoardingViewSeen) {

        var isLoggedIn = FirebaseAuthService().isLoggedIn();

        if (isLoggedIn) {
          Get.offAllNamed(MainView.routeName);
        }else{
        Get.offAllNamed(SignInView.routeName);
        }
      } else {
        Get.offAllNamed(OnBoardingView.routeName);
      }
      
    });
  }
}
