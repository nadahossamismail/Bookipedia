import 'package:bookipedia/app/style/app_text_style.dart';
import 'package:bookipedia/presentation_layer/screens/auth_screens/forgot_password/forgot_password_viewmodel.dart';
import 'package:bookipedia/presentation_layer/widgets/material_button.dart';
import 'package:bookipedia/presentation_layer/widgets/text_form_field.dart';
import 'package:flutter/material.dart';

class ForgotPasswordView extends StatefulWidget {
  const ForgotPasswordView({super.key});

  @override
  State<ForgotPasswordView> createState() => _ForgotPasswordViewState();
}

class _ForgotPasswordViewState extends State<ForgotPasswordView> {
  ForgotPasswordViewModel forgotPasswordViewModel = ForgotPasswordViewModel();

  @override
  void initState() {
    forgotPasswordViewModel.init();
    super.initState();
  }

  @override
  void dispose() {
    forgotPasswordViewModel.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: SafeArea(
            child: Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 20, vertical: AppSpacingSizing.s12),
                child: Form(
                    key: forgotPasswordViewModel.formKey,
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text("Forgot password",
                              style: AppTextStyle.title),
                          const SizedBox(height: AppSpacingSizing.s8),
                          const Text(
                              "Enter your email for verification process, we will send you 6 digits code.",
                              //  textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: FontSize.f18,
                                  fontWeight: FontWeight.w400)),
                          const SizedBox(height: AppSpacingSizing.s24),
                          AppTextFormField(
                            label: "Email",
                            keyboardType: TextInputType.emailAddress,
                            validator: forgotPasswordViewModel.validateEmail,
                            controller: forgotPasswordViewModel.emailController,
                          ),
                          const SizedBox(height: AppSpacingSizing.s48),
                          AppMaterialButton(
                              onPressed: () =>
                                  forgotPasswordViewModel.sendOtp(context),
                              text: "Continue"),
                        ])))));
  }
}
