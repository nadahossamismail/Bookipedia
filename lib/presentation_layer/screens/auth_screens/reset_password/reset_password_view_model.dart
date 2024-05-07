import 'package:bookipedia/app/app_strings.dart';
import 'package:flutter/material.dart';

class ResetPasswordViewModel {
  final formKey = GlobalKey<FormState>();
  late TextEditingController passwordController;
  late TextEditingController confirmPasswordController;

  void init() {
    passwordController = TextEditingController();
    confirmPasswordController = TextEditingController();
  }

  void dispose() {
    passwordController.dispose();
    confirmPasswordController.dispose();
  }

  String? validatePassword(String? password) {
    if (password == null || password.isEmpty) {
      return AppStrings.emptyField;
    } else if (password.length < 8) {
      return AppStrings.passwordTooShort;
    }
    return null;
  }

  String? validateConfirmPassword(String? password) {
    if (password == null || password.isEmpty) {
      return AppStrings.emptyField;
    } else if (password.compareTo(passwordController.text) != 0) {
      return AppStrings.notMatched;
    }
    return null;
  }

  void resetPassword() {
    if (formKey.currentState!.validate()) {}
  }
}
