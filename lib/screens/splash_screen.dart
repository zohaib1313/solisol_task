import 'dart:async';

import 'package:flutter/material.dart';
import 'package:solisoltask/screens/onboarding_screen.dart';
import 'package:solisoltask/utils/routes.dart';
import 'package:solisoltask/utils/styles.dart';

class SplashScreen extends StatefulWidget {
  static const id = 'SPLASH_SCREEN';

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Timer(
        const Duration(seconds: 3),
        () => {
              ///check if have logged in previous with sharedPref
              Navigator.of(myContext!).pushReplacementNamed(OnBoardingScreen.id)
            });

    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Text(
            "Splash Logo",
            style: AppTextStyles.textStyleBoldBodyMedium,
          ),
        ),
      ),
    );
  }
}
