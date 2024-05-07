import 'package:bookipedia/cubits/resend_verifivation/resend_verification_cubit.dart';
import 'package:bookipedia/cubits/verify_account/verify_account_cubit.dart';
import 'package:bookipedia/data_layer/models/resend_verification/resend_verification_request_model.dart';
import 'package:bookipedia/presentation_layer/widgets/alert_dialog.dart';
import 'package:bookipedia/presentation_layer/widgets/snack_bar.dart';
import 'package:custom_timer/custom_timer.dart';
import 'package:flutter/material.dart';

class VerifyAccountViewModel {
  static String? otp;
  static late CustomTimerController timerController;
  static late TextEditingController pinputController;

  static void initializeControllers(screen) {
    timerController = CustomTimerController(
        vsync: screen,
        begin: const Duration(minutes: 5),
        end: const Duration(),
        initialState: CustomTimerState.reset,
        interval: CustomTimerInterval.milliseconds);
    timerController.start();
    pinputController = TextEditingController();
  }

  static void dispose() {
    timerController.dispose();
    pinputController.dispose();
  }

  static void onResendComplete(context) {
    AppSnackBar.showSnackBar(context, "check your email!");
    timerController.reset();
    timerController.start();
  }

  static void onValidationFailure(context, state) {
    pinputController.clear();
    AppAlertDialog.showAlert(context, state.message);
  }

  static void resendVerifacationCode(context, state, email) {
    if (state is ResendVerificationLoading) {
      return;
    }
    ResendVerificationCubit.get(context)
        .sendRequest(ResendVerificationRequestBody(email: email));
    pinputController.clear();
  }

  static void submitVerificationLogic(context, state) {
    if (otp == null) {
      AppAlertDialog.showAlert(context, "Enter OPT first!");
    } else if (timerController.state.value == CustomTimerState.finished) {
      AppAlertDialog.showAlert(
          context, "Oops, time is up :(\nclick resend to get a new one");
    } else {
      state is VerifyAccountLoading ? null : submitVerificationCode(context);
    }
  }

  static void submitVerificationCode(context) async {
    VerifyAccountCubit.get(context).sendRequest(otp!);
  }
}
