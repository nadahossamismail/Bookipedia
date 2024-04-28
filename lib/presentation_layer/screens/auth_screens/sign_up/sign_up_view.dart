import 'package:bookipedia/app/app_routes.dart';
import 'package:bookipedia/app/style/app_text_style.dart';
import 'package:bookipedia/cubits/sign_up/sign_up_cubit.dart';
import 'package:bookipedia/cubits/visibility_icon/visibility_cubit.dart';
import 'package:bookipedia/presentation_layer/screens/auth_screens/sign_up/sign_up_viewmodel.dart';
import 'package:bookipedia/presentation_layer/widgets/loading.dart';
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
  var signUpViewModel = SignUpViewModel();

  @override
  void initState() {
    signUpViewModel.init();
    super.initState();
  }

  @override
  void dispose() {
    signUpViewModel.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => SignUpCubit()),
        BlocProvider(create: (context) => VisibilityCubit()),
      ],
      child: BlocConsumer<SignUpCubit, SignUpState>(
        listener: signUpViewModel.listener,
        builder: (context, state) {
          return Scaffold(
            body: GestureDetector(
              onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
              child: SafeArea(
                child: SingleChildScrollView(
                  keyboardDismissBehavior:
                      ScrollViewKeyboardDismissBehavior.onDrag,
                  padding: const EdgeInsets.all(AppSpacingSizing.s24),
                  child: Form(
                      key: signUpViewModel.formkey,
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const Text("Sign-up",
                                style: AppTextStyle.authHeadline),
                            const SizedBox(height: AppSpacingSizing.s32),
                            AppTextFormField(
                              label: "Name",
                              controller: signUpViewModel.usernameController,
                              keyboardType: TextInputType.name,
                              validator: signUpViewModel.validateUserName,
                            ),
                            const SizedBox(height: AppSpacingSizing.s24),
                            AppTextFormField(
                              label: "Email",
                              controller: signUpViewModel.emailController,
                              keyboardType: TextInputType.emailAddress,
                              validator: signUpViewModel.validateEmail,
                            ),
                            const SizedBox(height: AppSpacingSizing.s24),
                            BlocBuilder<VisibilityCubit, VisibilityState>(
                                builder: (context, state) {
                              return Column(children: [
                                AppTextFormField(
                                  label: "Password",
                                  isConfirm: false,
                                  validator: signUpViewModel.validatePassword,
                                  keyboardType: TextInputType.visiblePassword,
                                  controller:
                                      signUpViewModel.passwordController,
                                ),
                                const SizedBox(height: AppSpacingSizing.s24),
                                AppTextFormField(
                                  isConfirm: true,
                                  label: "Confirm Password",
                                  keyboardType: TextInputType.visiblePassword,
                                  validator:
                                      signUpViewModel.validateConfirmPassword,
                                  controller:
                                      signUpViewModel.confirmPasswordController,
                                )
                              ]);
                            }),
                            const SizedBox(height: AppSpacingSizing.s32),
                            AppMaterialButton(
                                text: 'Sign up',
                                child: state is SignUpLoading
                                    ? const Loading()
                                    : null,
                                onPressed: () => state is SignUpLoading
                                    ? null
                                    : signUpViewModel.signUp(context)),
                            const SizedBox(height: AppSpacingSizing.s4),
                            const SwitchMethod(
                                message: "Have an account?",
                                screen: Routes.loginRoute,
                                method: "Login")
                          ])),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
