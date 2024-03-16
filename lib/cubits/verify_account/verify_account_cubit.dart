import 'package:bookipedia/data_layer/Api_requests/verify_account_request.dart';
import 'package:bookipedia/data_layer/models/verify_account/verify_account_request_model.dart';
import 'package:bookipedia/data_layer/models/verify_account/verify_account_response_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'verify_account_state.dart';

class VerifyAccountCubit extends Cubit<VerifyAccountState> {
  VerifyAccountCubit() : super(VerifyAccountInitial());

  static VerifyAccountCubit get(context) => BlocProvider.of(context);

  void sendRequest(VerifyAccountRequestBody otp) async {
    VerifyAccountResponse response;

    emit(VerifyAccountLoading());

    response = await VerifyAccountRequest(otp).send();

    if (response.status == "success") {
      saveUserToken(response);
      emit(VerifyAccountCompleted());
    } else {
      emit(VerifyAccountFaliure(response.status));
    }
  }

  void saveUserToken(response) {}
}
