import 'package:bookipedia/app/style/app_colors.dart';
import 'package:flutter/material.dart';

class AppMaterialButton extends StatelessWidget {
  final void Function() onPressed;
  final String text;
  final double width;
  final Widget? child;

  const AppMaterialButton({
    super.key,
    required this.onPressed,
    required this.text,
    this.width = double.infinity,
    this.child,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
        minWidth: width,
        height: 60,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
        color: ColorManager.primary,
        onPressed: onPressed,
        child: child ??
            Text(
              text,
              style: const TextStyle(fontSize: 20, color: Colors.white),
            ));
  }
}
