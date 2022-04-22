import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:solisoltask/screens/onboarding_screen.dart';
import 'package:solisoltask/view_models/onboarding_view_model.dart';
import 'package:solisoltask/view_models/sign_in_view_model.dart';
import 'package:solisoltask/view_models/sign_up_view_model.dart';

import '../screens/splash_screen.dart';
import '../view_models/splash_view_model.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
BuildContext? myContext = navigatorKey.currentState!.context;

class RoutesAndNavigation {
  static final Map<String, Widget Function(BuildContext)> routes = {
    SplashScreen.id: (context) => SplashScreen(),
    OnBoardingScreen.id: (context) => OnBoardingScreen()
  };

  static final List<ChangeNotifierProvider<dynamic>> multiProviders = [
    ChangeNotifierProvider<SplashViewModel>(create: (_) => SplashViewModel()),
    ChangeNotifierProvider<OnBoardingViewModel>(
        create: (_) => OnBoardingViewModel()),
    ChangeNotifierProvider<SignInViewModel>(create: (_) => SignInViewModel()),
    ChangeNotifierProvider<SignUpViewModel>(create: (_) => SignUpViewModel()),
  ];
}
