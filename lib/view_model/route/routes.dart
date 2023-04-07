import 'package:flutter/material.dart';
import 'package:jobsque/view/screens/auth/register_screen/register_screen.dart';
import 'package:jobsque/view/screens/auth/reset_password/announce_password_changed.dart';
import 'package:jobsque/view/screens/auth/reset_password/announcing_chech_email.dart';
import 'package:jobsque/view/screens/auth/reset_password/create_password_screen.dart';
import 'package:jobsque/view_model/route/router.dart';
import '../../view/screens/app_layout/app_layout.dart';
import '../../view/screens/auth/login_screen/login_screen.dart';
import '../../view/screens/auth/register_screen/announcing_account_setup.dart';
import '../../view/screens/auth/register_screen/interested_work.dart';
import '../../view/screens/auth/register_screen/work_location.dart';
import '../../view/screens/auth/reset_password/reset_password_screen.dart';
import '../../view/screens/onboarding_screen/onboarding_screen.dart';
import '../../view/screens/splash_screen/splash_screen.dart';

Route<dynamic> onGenerate(RouteSettings routeSettings){
  switch(routeSettings.name){
    case AppRoutes.splashRoute:
      return MaterialPageRoute(builder: (_) => const SplashScreen(), settings: routeSettings);

    case AppRoutes.onBoardingRoute:
      return MaterialPageRoute(builder: (_) => const OnBoardingScreen(), settings: routeSettings);

    case AppRoutes.loginScreenRoute:
      return MaterialPageRoute(builder: (_) => LoginScreen(), settings: routeSettings);

    case AppRoutes.registerScreenRoute:
      return MaterialPageRoute(builder: (_) => RegisterScreen(), settings: routeSettings);

    case AppRoutes.interestedWorkScreenRoute:
      return MaterialPageRoute(builder: (_) => const InterestedWork(), settings: routeSettings);

    case AppRoutes.announceAccountScreenRoute:
      return MaterialPageRoute(builder: (_) => const AnnounceAccountSetUp(), settings: routeSettings);

    case AppRoutes.resetPasswordScreenRoute:
      return MaterialPageRoute(builder: (_) => ResetPasswordScreen(), settings: routeSettings);

    case AppRoutes.announceCheckEmailScreenRoute:
      return MaterialPageRoute(builder: (_) => const AnnounceCheckEmail(), settings: routeSettings);

    case AppRoutes.createPasswordScreenRoute:
      return MaterialPageRoute(builder: (_) => CreatePasswordScreen(), settings: routeSettings);

    case AppRoutes.announcePasswordChangedScreenRoute:
      return MaterialPageRoute(builder: (_) => const AnnouncePasswordChanged(), settings: routeSettings);

    case AppRoutes.layoutScreenRoute:
      return MaterialPageRoute(builder: (_) => const AppLayout(), settings: routeSettings);







    default:
      return MaterialPageRoute(builder: (_) => const SplashScreen(), settings: routeSettings);
  }
}