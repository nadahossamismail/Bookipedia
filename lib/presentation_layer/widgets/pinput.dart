import 'package:bookipedia/app/style/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';

class AppPinput extends StatelessWidget {
  final Function(String)? onComplete;
  final TextEditingController controller;

  const AppPinput({super.key, this.onComplete, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Pinput(
        length: 6,
        onSubmitted: onComplete,
        controller: controller,
        onCompleted: onComplete,
        defaultPinTheme: PinTheme(
            width: 50,
            height: 50,
            textStyle:
                const TextStyle(fontSize: 19, fontWeight: FontWeight.w500),
            decoration: BoxDecoration(
                color: ColorManager.primaryLight,
                borderRadius: BorderRadius.circular(10))));
  }
}
