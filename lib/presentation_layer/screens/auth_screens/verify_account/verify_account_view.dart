import 'package:bookipedia/app/app_routes.dart';
import 'package:bookipedia/cubits/resend_verifivation/resend_verification_cubit.dart';
import 'package:bookipedia/cubits/verify_account/verify_account_cubit.dart';
import 'package:bookipedia/presentation_layer/screens/auth_screens/verify_account/verify_account_viewmodel.dart';
import 'package:bookipedia/presentation_layer/widgets/Loading.dart';
import 'package:bookipedia/presentation_layer/widgets/alert_dialog.dart';
import 'package:bookipedia/presentation_layer/widgets/material_button.dart';
import 'package:bookipedia/presentation_layer/widgets/pinput.dart';
import 'package:bookipedia/presentation_layer/widgets/snack_bar.dart';
import 'package:custom_timer/custom_timer.dart';
import 'package:bookipedia/app/style/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class VerifyAccountView extends StatefulWidget {
  final String userEmail;
  const VerifyAccountView(this.userEmail, {super.key});

  @override
  State<VerifyAccountView> createState() => _VerifyAccountViewState();
}

class _VerifyAccountViewState extends State<VerifyAccountView>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    VerifyAccountViewModel.initializeControllers(this);
    super.initState();
  }

  @override
  void dispose() {
    VerifyAccountViewModel.dispose();
    super.dispose();
  }

  bool value = false;

  bool canResend() {
    VerifyAccountViewModel.timerController.addListener(() {
      setState(() {
        value = VerifyAccountViewModel.timerController.state.value ==
            CustomTimerState.finished;
      });
    });
    return value;
  }

  @override
  Widget build(BuildContext context) {
    VerifyAccountViewModel? verifyAccountViewModel;
    return MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => VerifyAccountCubit()),
          BlocProvider(create: (context) => ResendVerificationCubit())
        ],
        child: BlocConsumer<VerifyAccountCubit, VerifyAccountState>(
          listener: (context, state) {
            if (state is VerifyAccountCompleted) {
              Navigator.of(context).pushReplacementNamed(Routes.homeRoute);
            } else if (state is VerifyAccountFaliure) {
              VerifyAccountViewModel.onValidationFailure(context, state);
            }
          },
          builder: (context, state) {
            return Scaffold(
              body: SafeArea(
                child: SingleChildScrollView(
                  child: Container(
                    margin: const EdgeInsets.symmetric(
                        vertical: 60, horizontal: 20),
                    child: Column(
                      children: [
                        const Text("Verification Code",
                            textAlign: TextAlign.center,
                            style: AppTextStyle.title),
                        const SizedBox(height: AppSpacingSizing.s4),
                        Text(
                          "Please enter the code sent to : ${widget.userEmail}.",
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w400),
                        ),
                        const SizedBox(height: AppSpacingSizing.s24),
                        AppPinput(
                            controller: VerifyAccountViewModel.pinputController,
                            onComplete: (otp) => verifyAccountViewModel =
                                VerifyAccountViewModel(otp: otp)),
                        const SizedBox(height: AppSpacingSizing.s24),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text("Will expire after:  ",
                                style: TextStyle(fontSize: 18)),
                            CustomTimer(
                                controller:
                                    VerifyAccountViewModel.timerController,
                                builder: (state, time) {
                                  return Text("${time.minutes}:${time.seconds}",
                                      style: const TextStyle(
                                          color: Colors.red,
                                          fontSize: 24.0,
                                          fontWeight: FontWeight.w600));
                                }),
                          ],
                        ),
                        const SizedBox(height: AppSpacingSizing.s32),
                        BlocConsumer<ResendVerificationCubit,
                            ResendVerificationState>(
                          listener: (context, state) {
                            if (state is ResendVerificationLoading) {
                              AppSnackBar.showSnackBar(
                                  context, "sending new code ...");
                            } else if (state is ResendVerificationCompleted) {
                              VerifyAccountViewModel.onResendComplete(context);
                            } else if (state is ResendVerificationFailure) {
                              setState(() {
                                value = true;
                              });
                              AppAlertDialog.showAlert(
                                  context, "Please try again later");
                            }
                          },
                          builder: (context, state) => Visibility(
                              visible: canResend(),
                              child: TextButton.icon(
                                  label: Text("Resend code",
                                      style: AppTextStyle.textButtonText),
                                  icon: const Icon(Icons.refresh),
                                  onPressed: () => VerifyAccountViewModel
                                      .resendVerifacationCode(
                                          context, state, widget.userEmail))),
                        ),
                        const SizedBox(height: AppSpacingSizing.s8),
                        AppMaterialButton(
                            text: "Submit",
                            child: state is VerifyAccountLoading
                                ? const Loading()
                                : null,
                            onPressed: () =>
                                VerifyAccountViewModel.submitVerificationLogic(
                                    verifyAccountViewModel, context, state))
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ));
  }
}
