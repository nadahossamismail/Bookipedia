import 'package:bookipedia/app/app_strings.dart';
import 'package:bookipedia/data_layer/Api_requests/sign_up_request.dart';
import 'package:bookipedia/data_layer/models/sign_up/sign_up_request_model.dart';
import 'package:bookipedia/data_layer/models/sign_up/sign_up_response_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'sign_up_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  SignUpCubit() : super(SignUpInitial());

  static SignUpCubit get(context) => BlocProvider.of(context);

  void sendRequest(SignUpRequestBody userData) async {
    SignUpResponse response;

    emit(SignUpLoading());

    response = await SignUpRequest(userData).send();

    if (response.status == AppStrings.success) {
      emit(SignUpCompleted());
    } else {
      emit(SignUpFailure(response.message));
    }
  }
}
