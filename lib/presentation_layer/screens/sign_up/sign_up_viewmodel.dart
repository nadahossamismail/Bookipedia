import 'package:bookipedia/app/error_messages.dart';
import 'package:bookipedia/cubits/sign_up/sign_up_cubit.dart';
import 'package:bookipedia/data_layer/models/sign_up/sign_up_request_model.dart';
import 'package:bookipedia/presentation_layer/screens/verify_account/verify_account_view.dart';
import 'package:bookipedia/presentation_layer/widgets/snack_bar.dart';
import 'package:flutter/material.dart';

class SignUpViewModel {
  var formkey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  TextEditingController usernameController = TextEditingController();

  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    usernameController.dispose();
  }

  String? validateUserName(String? username) {
    if (username!.isEmpty) {
      return ErrorMessages().emptyField;
    }
    return null;
  }

  String? validateEmail(String? email) {
    if (email!.isEmpty) {
      return ErrorMessages().emptyField;
    } else if (!email.contains("@")) {
      return "Not vaild";
    }
    return null;
  }

  String? validatePassword(String? password) {
    if (password!.isEmpty) {
      return ErrorMessages().emptyField;
    } else if (password.length < 8) {
      return "Password is too short";
    }
    return null;
  }

  String? validateConfirmPassword(String? password) {
    if (password!.isEmpty) {
      return ErrorMessages().emptyField;
    } else if (password.compareTo(passwordController.text) != 0) {
      return "Not matched";
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

  void goToVerifyAccount(context) {
    Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (_) => VerifyAccountView(emailController.text)));
    AppSnackBar.showSnackBar(context, "Check your mail!");
  }

  void signUp(context) {
    if (formkey.currentState!.validate()) {
      SignUpCubit.get(context).sendRequest(getRequestBody());
    }
  }
}
