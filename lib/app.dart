
import 'package:bookipedia/app/app_routes.dart';
import 'package:bookipedia/app/style/app_theme.dart';
import 'package:bookipedia/presentation_layer/views/login_view.dart';
import 'package:flutter/material.dart';


class MyApp extends StatelessWidget
{
  const MyApp._internal();

  static const  MyApp _instance =  MyApp._internal();
  factory MyApp()=> _instance;
  
  @override
  Widget build(BuildContext context) {
   return MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeManger().getApplicationTheme(),
    onGenerateRoute:RouteGenerator.generateRoute ,
    home:const LoginView(),
      
    );
  }
}