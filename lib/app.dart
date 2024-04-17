import 'package:bookipedia/app/app_routes.dart';
import 'package:bookipedia/app/style/app_theme.dart';
import 'package:bookipedia/presentation_layer/screens/auth_screens/login/login_view.dart';
import 'package:bookipedia/presentation_layer/screens/auth_screens/reset_password/reset_password_view.dart';
import 'package:bookipedia/presentation_layer/screens/auth_screens/sign_up/sign_up_view.dart';
import 'package:bookipedia/presentation_layer/screens/home/home_view.dart';
import 'package:bookipedia/presentation_layer/screens/auth_screens/verify_account/verify_account_view.dart';

import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp._internal();

  static const MyApp _instance = MyApp._internal();
  factory MyApp() => _instance;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeManger().getApplicationTheme(),
      darkTheme: ThemeData.dark().copyWith(hintColor: Colors.white),
      themeMode: ThemeMode.light,
      onGenerateRoute: RouteGenerator.generateRoute,
      home: const LoginView(),
    );
  }
}
