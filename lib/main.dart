import 'package:bloc/bloc.dart';
import 'package:bookipedia/app.dart';
import 'package:bookipedia/app/bloc_observer.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

late SharedPreferences preferences;
void main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  // FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  Bloc.observer = MyBlocObserver();
  preferences = await SharedPreferences.getInstance();
  runApp(MyApp());
}
