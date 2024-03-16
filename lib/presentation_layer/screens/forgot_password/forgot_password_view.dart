import 'package:bookipedia/app/error_messages.dart';
import 'package:bookipedia/app/style/app_text_style.dart';
import 'package:bookipedia/presentation_layer/widgets/material_button.dart';
import 'package:bookipedia/presentation_layer/widgets/text_form_field.dart';
import 'package:flutter/material.dart';

class ForgotPasswordView extends StatefulWidget {
  const ForgotPasswordView({super.key});

  @override
  State<ForgotPasswordView> createState() => _ForgotPasswordViewState();
}

class _ForgotPasswordViewState extends State<ForgotPasswordView> {
  final email = TextEditingController();
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
          child: Form(
            key: formKey,
            child: Column(children: [
              const Text(
                "Forgot password",
                textAlign: TextAlign.center,
                style: AppTextStyle.title,
              ),
              const SizedBox(height: 7),
              const Text(
                "Enter your email for verification process, we will send you 6 digits code.",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
              ),
              const SizedBox(height: 30),
              AppTextFormField(
                controller: email,
                label: "Email",
                keyboardType: TextInputType.emailAddress,
                validator: (value) {
                  if (value!.isEmpty) {
                    return ErrorMessages().emptyField;
                  } else if (!value.contains("@")) {
                    return "Not Vaild";
                  }
                  return null;
                },
              ),
              const SizedBox(height: 50),
              AppMaterialButton(
                onPressed: () {
                  if (formKey.currentState!.validate()) {}
                },
                text: "Continue",
              )
            ]),
          ),
        ),
      ),
    );
  }
}
