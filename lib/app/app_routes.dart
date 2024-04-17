<<<<<<< HEAD
import 'package:bookipedia/presentation_layer/screens/Library/libraryscreen.dart';
import 'package:bookipedia/presentation_layer/screens/UserDocument/userdocument.dart';
import 'package:bookipedia/presentation_layer/screens/forgot_password/forgot_password_view.dart';
=======
import 'package:bookipedia/presentation_layer/screens/auth_screens/forgot_password/forgot_password_view.dart';
import 'package:bookipedia/presentation_layer/screens/auth_screens/login/login_view.dart';
import 'package:bookipedia/presentation_layer/screens/auth_screens/reset_password/reset_password_view.dart';
>>>>>>> 1502be613f039e85c606e95a57dd3f4f51ad26cc
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
<<<<<<< HEAD
  static const String userDocumentScreen = "/userDocumentScreen";
  static const String libraryScreen = "/libraryScreen";
=======
  static const String resetPasswordRoute = "/resetPassword";
>>>>>>> 1502be613f039e85c606e95a57dd3f4f51ad26cc
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
      case Routes.libraryScreen:
        return MaterialPageRoute(builder: (_) => const LibraryScreen());
      case Routes.userDocumentScreen:
        return MaterialPageRoute(builder: (_) => const UserDocumentScreen());

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
