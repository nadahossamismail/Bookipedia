import 'package:bookipedia/app/app_routes.dart';
import 'package:bookipedia/app/style/app_text_style.dart';
import 'package:bookipedia/cubits/sign_up/sign_up_cubit.dart';
import 'package:bookipedia/presentation_layer/screens/sign_up/sign_up_viewmodel.dart';
import 'package:bookipedia/presentation_layer/widgets/Loading.dart';
import 'package:bookipedia/presentation_layer/widgets/alert_dialog.dart';
import 'package:bookipedia/presentation_layer/widgets/material_button.dart';
import 'package:bookipedia/presentation_layer/widgets/switch_auth_method.dart';
import 'package:bookipedia/presentation_layer/widgets/text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  bool visible = true;
  var signUpViewModel = SignUpViewModel();

  @override
  void dispose() {
    signUpViewModel.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var visibilityIcon = visible
        ? const Icon(Icons.visibility_off)
        : const Icon(Icons.remove_red_eye);

    var suffixIcon = IconButton(
        onPressed: () {
          setState(() {
            visible = !visible;
          });
        },
        icon: visibilityIcon);

    return BlocProvider(
      create: (context) => SignUpCubit(),
      child: BlocConsumer<SignUpCubit, SignUpState>(
        listener: (context, state) {
          if (state is SignUpFailure) {
            return AppAlertDialog.showAlert(context, state.message);
          } else if (state is SignUpCompleted) {
            return signUpViewModel.goToVerifyAccount(context);
          }
        },
        builder: (context, state) {
          return Scaffold(
            body: GestureDetector(
              onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
              child: SafeArea(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.all(20),
                  child: Form(
                    key: signUpViewModel.formkey,
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text("Sign-up", style: AppTextStyle.authHeadline),
                          const SizedBox(height: 40),
                          AppTextFormField(
                            label: "Name",
                            controller: signUpViewModel.usernameController,
                            keyboardType: TextInputType.name,
                            validator: signUpViewModel.validateUserName,
                          ),
                          const SizedBox(height: 30),
                          AppTextFormField(
                            label: "Email",
                            controller: signUpViewModel.emailController,
                            keyboardType: TextInputType.emailAddress,
                            validator: signUpViewModel.validateEmail,
                          ),
                          const SizedBox(height: 30),
                          AppTextFormField(
                              label: "Password",
                              validator: signUpViewModel.validatePassword,
                              keyboardType: TextInputType.visiblePassword,
                              controller: signUpViewModel.passwordController,
                              obscureText: visible,
                              suffixIcon: suffixIcon),
                          const SizedBox(height: 30),
                          AppTextFormField(
                            obscureText: visible,
                            suffixIcon: suffixIcon,
                            label: "Confirm Password",
                            validator: signUpViewModel.validateConfirmPassword,
                            keyboardType: TextInputType.visiblePassword,
                            controller:
                                signUpViewModel.confirmPasswordController,
                          ),
                          const SizedBox(height: 50),
                          AppMaterialButton(
                              text: 'Sign up',
                              child: state is SignUpLoading
                                  ? const Loading()
                                  : null,
                              onPressed: () => state is SignUpLoading
                                  ? null
                                  : signUpViewModel.signUp(context)),
                          const SizedBox(height: 5),
                          const SwitchMethod(
                            message: "Have an account?",
                            screen: Routes.loginRoute,
                            method: "Login",
                          )
                        ]),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
