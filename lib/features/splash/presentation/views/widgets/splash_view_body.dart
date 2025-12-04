import 'package:flutter/material.dart';
import 'package:fruits_hub/core/constants.dart';
import 'package:fruits_hub/core/services/shared_preferences_singleton.dart';
import 'package:fruits_hub/core/utils/app_images.dart';
import 'package:fruits_hub/features/auth/presentation/views/sign_in_view.dart';
import 'package:fruits_hub/features/on_boarding/presentation/views/on_boarding_view.dart';
import 'package:svg_flutter/svg.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody> {

@override
  void initState() {

    excuteNaviagtion();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return  Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [ 
          SvgPicture.asset(Assets.imagesPlant),
          ],
          ),
        SvgPicture.asset(Assets.imagesLogo),
        SvgPicture.asset(Assets.imagesSplashBottom,
        fit: BoxFit.fill,
        ),
      ],
    );
  }
  
  void excuteNaviagtion() {
    bool  isOnBoardingViewSeen = Prefs.getBool(kIsOnBoardingViewSeen);
    Future.delayed(const Duration(seconds: 3),(){
      if (isOnBoardingViewSeen) {
        // ignore: use_build_context_synchronously
        Navigator.pushReplacementNamed(context, SignInView.routeName);
      } else {
        // ignore: use_build_context_synchronously
        Navigator.pushReplacementNamed(context, OnBoardingView.routeName);
      }
      
    });
  }
}