import 'package:bookipedia/app/app_strings.dart';
import 'package:bookipedia/presentation_layer/screens/auth_screens/verify_account/verify_account_view.dart';
import 'package:flutter/material.dart';

class ForgotPasswordViewModel {
  late TextEditingController emailController;
  final formKey = GlobalKey<FormState>();
  void init() {
    emailController = TextEditingController();
  }

  void dispose() {
    emailController.dispose();
  }

  String? validateEmail(email) {
    if (email == null || email.isEmpty) {
      return AppStrings.emptyField;
    } else if (!email.contains("@")) {
      return AppStrings.notValid;
    }
    return null;
  }

  void sendOtp(context) {
    if (formKey.currentState!.validate()) {
      Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (_) => VerifyAccountView(emailController.text)));
    }
  }
}
