import 'package:bookipedia/app/app_strings.dart';

import 'package:bookipedia/cubits/sign_up/sign_up_cubit.dart';
import 'package:bookipedia/data_layer/models/sign_up/sign_up_request_model.dart';
import 'package:bookipedia/presentation_layer/screens/auth_screens/verify_account/verify_account_view.dart';
import 'package:bookipedia/presentation_layer/widgets/alert_dialog.dart';
import 'package:bookipedia/presentation_layer/widgets/snack_bar.dart';
import 'package:flutter/material.dart';

class SignUpViewModel {
  var formkey = GlobalKey<FormState>();
  late TextEditingController emailController;
  late TextEditingController passwordController;
  late TextEditingController confirmPasswordController;
  late TextEditingController usernameController;

  void init() {
    emailController = TextEditingController();
    passwordController = TextEditingController();
    confirmPasswordController = TextEditingController();
    usernameController = TextEditingController();
  }

  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    usernameController.dispose();
  }

  String? validateUserName(String? username) {
    if (username == null || username.isEmpty) {
      return AppStrings.emptyField;
    }
    return null;
  }

  String? validateEmail(String? email) {
    if (email == null || email.isEmpty) {
      return AppStrings.emptyField;
    } else if (!email.contains("@")) {
      return AppStrings.notValid;
    }
    return null;
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

  SignUpRequestBody getRequestBody() {
    return SignUpRequestBody(
        email: emailController.text,
        name: usernameController.text,
        password: passwordController.text,
        passwordConfirm: confirmPasswordController.text);
  }

  void listener(context, state) {
    if (state is SignUpFailure) {
      AppAlertDialog.showAlert(context, state.message);
    } else if (state is SignUpCompleted) {
      goToVerifyAccount(context);
    }
  }

  void goToVerifyAccount(context) {
    Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (_) => VerifyAccountView(emailController.text)));
    AppSnackBar.showSnackBar(context, "Check your email!");
  }

  void signUp(context) {
    if (formkey.currentState!.validate()) {
      SignUpCubit.get(context).sendRequest(getRequestBody());
    }
  }
}
