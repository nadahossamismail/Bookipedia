import 'package:bookipedia/app/api_constants.dart';
import 'package:bookipedia/data_layer/network/dio_factory.dart';
import 'package:bookipedia/data_layer/models/sign_up/sign_up_request_model.dart';
import 'package:bookipedia/data_layer/models/sign_up/sign_up_response_model.dart';
import 'package:bookipedia/data_layer/network/enum_handler.dart';
import 'package:dio/dio.dart';

class SignUpRequest {
  final SignUpRequestBody userData;
  final dio = DioFactory.getDio();

  SignUpRequest(this.userData);

  Future<SignUpResponse> send() async {
    Response response;
    var data = signUpRequestToJson(userData);
    SignUpResponse signUpResponse;
    try {
      response = await dio.post(ApiEndpoints.signUpEndPoint, data: data);
      signUpResponse = SignUpResponse.fromJson(response.data);
      return signUpResponse;
    } catch (error) {
      if (error is DioException) {
        if (error.response!.statusCode == 500) {
          return SignUpResponse(
              status: "duplicate", message: "This email already exists!");
        }
        if (error.type == DioExceptionType.connectionTimeout) {
          return SignUpResponse(
              status: "time out", message: "Check your internet connection");
        }
      }
      return SignUpResponse.empty();
    }
  }
}
