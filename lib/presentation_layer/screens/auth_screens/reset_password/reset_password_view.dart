import 'package:bookipedia/app/style/app_text_style.dart';
import 'package:bookipedia/cubits/visibility_icon/visibility_cubit.dart';
import 'package:bookipedia/presentation_layer/screens/auth_screens/reset_password/reset_password_view_model.dart';
import 'package:bookipedia/presentation_layer/widgets/material_button.dart';
import 'package:bookipedia/presentation_layer/widgets/text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ResetPasswordView extends StatefulWidget {
  const ResetPasswordView({super.key});

  @override
  State<ResetPasswordView> createState() => _ResetPasswordViewState();
}

class _ResetPasswordViewState extends State<ResetPasswordView> {
  ResetPasswordViewModel resetPasswordViewModel = ResetPasswordViewModel();
  @override
  void initState() {
    resetPasswordViewModel.init();
    super.initState();
  }

  @override
  void dispose() {
    resetPasswordViewModel.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => VisibilityCubit(),
      child: Scaffold(
        body: SafeArea(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
            child: Form(
              key: resetPasswordViewModel.formKey,
              child: Column(children: [
                const Text(
                  "Reset password",
                  textAlign: TextAlign.center,
                  style: AppTextStyle.title,
                ),
                const SizedBox(height: AppSpacingSizing.s4),
                const Text(
                  "Enter your new password.",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
                ),
                const SizedBox(height: AppSpacingSizing.s24),
                BlocBuilder<VisibilityCubit, VisibilityState>(
                    builder: (context, state) {
                  return Column(children: [
                    AppTextFormField(
                        controller: resetPasswordViewModel.passwordController,
                        label: "Password",
                        keyboardType: TextInputType.visiblePassword,
                        isConfirm: false,
                        validator: resetPasswordViewModel.validatePassword),
                    const SizedBox(height: AppSpacingSizing.s24),
                    AppTextFormField(
                        controller:
                            resetPasswordViewModel.confirmPasswordController,
                        label: "Confirm password",
                        isConfirm: true,
                        keyboardType: TextInputType.visiblePassword,
                        validator:
                            resetPasswordViewModel.validateConfirmPassword)
                  ]);
                }),
                const SizedBox(height: AppSpacingSizing.s32),
                AppMaterialButton(
                  onPressed: resetPasswordViewModel.resetPassword,
                  text: "Reset Password",
                )
              ]),
            ),
          ),
        ),
      ),
    );
  }
}
