import 'package:bookipedia/presentation_layer/views/login_view.dart';
import 'package:bookipedia/presentation_layer/views/splash_view.dart';
import 'package:flutter/material.dart';

class Routes 
{
  static const String splashRoute= "/splash";
  static const String loginRoute= "/login";
  static const String registerRoute= "/register";
  static const String profileRoute= "/profile";
  static const String onboardingRoute= "/onboarding";

}
class RouteGenerator 
{
  static Route<dynamic> generateRoute (RouteSettings settings)
  {
    switch (settings.name)
    {
      case Routes.loginRoute:
      return MaterialPageRoute(builder:(_)=>const LoginView());
      case Routes.splashRoute:
      return MaterialPageRoute(builder:(_)=> SplashView());
      default:
      return undefinedRoute();

    }
  }
  static Route<dynamic> undefinedRoute()
  {
    return MaterialPageRoute(builder: (_)=>const Scaffold(body: Center(child:Text("Not Found")),));
  }
}