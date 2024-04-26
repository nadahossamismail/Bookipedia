import 'package:bookipedia/data_layer/Api_requests/login_request.dart';
import 'package:bookipedia/data_layer/models/login/login_request_model.dart';
import 'package:bookipedia/data_layer/models/login/login_response_model.dart';
import 'package:bookipedia/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

  static LoginCubit get(context) => BlocProvider.of(context);

  void sendRequest(LoginRequestBody userData) async {
    LoginResponse response;

    emit(LoginLoading());

    response = await LoginRequest(userData).send();

    if (response.status == "success") {
      saveToken(response.token);
      emit(LoginCompleted());
    } else {
      emit(LoginFailure(response.status));
    }
  }

  void saveToken(token) {
    preferences.setString('token', token);
    print("token: $token");
  }
}
