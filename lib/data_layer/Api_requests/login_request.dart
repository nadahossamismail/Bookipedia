import 'package:bookipedia/app/api_constants.dart';
import 'package:bookipedia/data_layer/models/login/login_request_model.dart';
import 'package:bookipedia/data_layer/models/login/login_response_model.dart';
import 'package:bookipedia/data_layer/network/dio_factory.dart';
import 'package:bookipedia/data_layer/network/enum_handler.dart';
import 'package:dio/dio.dart';

class LoginRequest {
  final LoginRequestBody userData;
  final dio = DioFactory.getDio();

  LoginRequest(this.userData);

  Future<LoginResponse> send() async {
    Response response;
    var data = loginRequestBodyToJson(userData);
    LoginResponse loginResponse;
    try {
      response = await dio.post(ApiEndpoints.loginEndPoint, data: data);
      loginResponse = LoginResponse.fromJson(response.data);

      return loginResponse;
    } catch (error) {
      var handler = ErrorHandler.handle(error);
      return LoginResponse.empty(status: handler.failure.message);
    }
  }
}
