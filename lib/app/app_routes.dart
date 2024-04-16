import 'package:bookipedia/presentation_layer/screens/auth_screens/forgot_password/forgot_password_view.dart';
import 'package:bookipedia/presentation_layer/screens/auth_screens/login/login_view.dart';
import 'package:bookipedia/presentation_layer/screens/auth_screens/reset_password/reset_password_view.dart';
import 'package:bookipedia/presentation_layer/screens/home/home_view.dart';
import 'package:bookipedia/presentation_layer/screens/auth_screens/sign_up/sign_up_view.dart';
import 'package:bookipedia/presentation_layer/screens/splash/splash_view.dart';
import 'package:flutter/material.dart';

class Routes {
  static const String splashRoute = "/splash";
  static const String loginRoute = "/login";
  static const String signUpRoute = "/signUp";
  static const String profileRoute = "/profile";
  static const String onboardingRoute = "/onboarding";
  static const String verifyAccountRoute = "/verifyAccountRoute";
  static const String homeRoute = "/homeRoute";
  static const String forgotPasswordRoute = "/forgotPassword";
  static const String resetPasswordRoute = "/resetPassword";
}

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.loginRoute:
        return MaterialPageRoute(builder: (_) => const LoginView());
      case Routes.splashRoute:
        return MaterialPageRoute(builder: (_) => const SplashView());
      case Routes.signUpRoute:
        return MaterialPageRoute(builder: (_) => const SignUp());
      // case Routes.verifyAccountRoute:
      //   return MaterialPageRoute(builder: (_) => const VerifyAccountView());
      case Routes.homeRoute:
        return MaterialPageRoute(builder: (_) => const HomeView());
      case Routes.resetPasswordRoute:
        return MaterialPageRoute(builder: (_) => const ResetPasswordView());
      case Routes.forgotPasswordRoute:
        return MaterialPageRoute(builder: (_) => const ForgotPasswordView());

      default:
        return undefinedRoute();
    }
  }

  static Route<dynamic> undefinedRoute() {
    return MaterialPageRoute(
        builder: (_) => const Scaffold(
              body: Center(child: Text("Not Found")),
            ));
  }
}
