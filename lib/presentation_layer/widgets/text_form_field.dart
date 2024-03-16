import 'package:bookipedia/app/style/app_colors.dart';
import 'package:flutter/material.dart';

class AppTextFormField extends StatelessWidget {
  final String? Function(String?)? validator;
  final TextInputType? keyboardType;
  final TextEditingController controller;
  final Icon? prefixIcon;
  final bool obscureText;
  final String label;
  final Widget? suffixIcon;

  const AppTextFormField({
    super.key,
    this.validator,
    this.keyboardType,
    required this.controller,
    this.prefixIcon,
    this.obscureText = false,
    required this.label,
    this.suffixIcon,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator,
      keyboardType: keyboardType,
      controller: controller,
      obscureText: obscureText,
      autocorrect: false,
      enableIMEPersonalizedLearning: false,
      decoration: InputDecoration(
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: ColorManager.primary),
            borderRadius: const BorderRadius.all(
              Radius.circular(25),
            )),
        labelText: label,
        prefixIcon: prefixIcon,
        floatingLabelStyle: const TextStyle(color: Colors.white),
        floatingLabelBehavior: FloatingLabelBehavior.never,
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 30, vertical: 18),
        suffixIcon: suffixIcon,
        border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(
          Radius.circular(25),
        )),
      ),
    );
  }
}
