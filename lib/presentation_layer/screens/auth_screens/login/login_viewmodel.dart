import 'package:bookipedia/app/error_messages.dart';
import 'package:bookipedia/cubits/login/login_cubit.dart';
import 'package:bookipedia/data_layer/models/login/login_request_model.dart';
import 'package:flutter/material.dart';

class LoginViewModel {
  var formkey = GlobalKey<FormState>();
  late TextEditingController emailController;
  late TextEditingController passwordContoller;

  void init() {
    emailController = TextEditingController();
    passwordContoller = TextEditingController();
  }

  void dispose() {
    emailController.dispose();
    passwordContoller.dispose();
  }

  String? validateEmail(email) {
    if (email == null || email.isEmpty) {
      return ErrorMessages().emptyField;
    } else if (!email.contains("@")) {
      return "Not Vaild";
    }
    return null;
  }

  String? validatePassword(password) {
    if (password == null || password.isEmpty) {
      return ErrorMessages().emptyField;
    }
    return null;
  }

  LoginRequestBody getRequestBody() {
    return LoginRequestBody(
        email: emailController.text, password: passwordContoller.text);
  }

  void login(context) {
    if (formkey.currentState!.validate()) {
      LoginCubit.get(context).sendRequest(getRequestBody());
    }
  }
}
