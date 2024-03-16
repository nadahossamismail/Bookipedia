import 'package:bookipedia/app/app_routes.dart';
import 'package:bookipedia/app/style/app_colors.dart';
import 'package:bookipedia/app/style/app_text_style.dart';
import 'package:bookipedia/presentation_layer/widgets/material_button.dart';
import 'package:bookipedia/app/error_messages.dart';
import 'package:bookipedia/presentation_layer/widgets/switch_auth_method.dart';
import 'package:bookipedia/presentation_layer/widgets/text_form_field.dart';
import 'package:flutter/material.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  var visible = true;
  var formkey = GlobalKey<FormState>();
  var emailController = TextEditingController();
  var passwordContoller = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordContoller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
      child: SafeArea(
          child: SingleChildScrollView(
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Form(
          key: formkey,
          child: Column(children: [
            Text("Login", style: AppTextStyle.authHeadline),
            const SizedBox(height: 30),
            AppTextFormField(
              validator: (value) {
                if (value!.isEmpty) {
                  return ErrorMessages().emptyField;
                }
                return null;
              },
              keyboardType: TextInputType.emailAddress,
              controller: emailController,
              label: "Email",
            ),
            const SizedBox(height: 25),
            AppTextFormField(
                validator: (value) {
                  if (value!.isEmpty) {
                    return ErrorMessages().emptyField;
                  }
                  return null;
                },
                keyboardType: TextInputType.visiblePassword,
                controller: passwordContoller,
                obscureText: visible,
                label: "Password",
                suffixIcon: IconButton(
                    onPressed: () {
                      setState(() {
                        visible = !visible;
                      });
                    },
                    icon: visible
                        ? const Icon(Icons.visibility_off)
                        : const Icon(Icons.remove_red_eye))),
            const SizedBox(height: 5),
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                  onPressed: () => Navigator.of(context)
                      .pushNamed(Routes.forgotPasswordRoute),
                  child: Text("Forgot password?",
                      style: TextStyle(color: ColorManager.primary))),
            ),
            const SizedBox(height: 30),
            AppMaterialButton(
              text: 'Login',
              onPressed: () async {
                if (formkey.currentState!.validate()) {}
              },
            ),
            const SizedBox(height: 5),
            const SwitchMethod(
              message: "Don't have an account?",
              screen: Routes.signUpRoute,
              method: "Sign up",
            )
          ]),
        ),
      )),
    ));
  }
}
