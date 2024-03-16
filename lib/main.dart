import 'package:bloc/bloc.dart';
import 'package:bookipedia/app.dart';
import 'package:bookipedia/app/bloc_observer.dart';
import 'package:flutter/material.dart';

void main() {
  Bloc.observer = MyBlocObserver();
  runApp(MyApp());
}
