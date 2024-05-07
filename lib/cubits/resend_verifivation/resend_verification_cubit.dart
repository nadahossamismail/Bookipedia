import 'package:bookipedia/app/app_strings.dart';
import 'package:bookipedia/data_layer/Api_requests/resend_verification_request.dart';
import 'package:bookipedia/data_layer/models/resend_verification/resend_verification_request_model.dart';
import 'package:bookipedia/data_layer/models/resend_verification/resend_verification_response_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'resend_verification_state.dart';

class ResendVerificationCubit extends Cubit<ResendVerificationState> {
  ResendVerificationCubit() : super(ResendVerificationInitial());

  static ResendVerificationCubit get(context) => BlocProvider.of(context);

  void sendRequest(ResendVerificationRequestBody email) async {
    ResendVerificationResponse response;

    emit(ResendVerificationLoading());

    response = await ResendVerificationRequest(email).send();

    if (response.status == AppStrings.success) {
      emit(ResendVerificationCompleted());
    } else {
      emit(ResendVerificationFailure());
    }
  }
}
