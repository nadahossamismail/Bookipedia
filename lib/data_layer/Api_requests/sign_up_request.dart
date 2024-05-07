import 'package:bookipedia/app/api_constants.dart';
import 'package:bookipedia/app/app_strings.dart';
import 'package:bookipedia/data_layer/network/dio_factory.dart';
import 'package:bookipedia/data_layer/models/sign_up/sign_up_request_model.dart';
import 'package:bookipedia/data_layer/models/sign_up/sign_up_response_model.dart';
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

      var failure = ErrorHandler.handle(error).failure;
      var message =
          failure.code == 500 ? AppStrings.emailExists : failure.message;
      return SignUpResponse.empty(message);

    }
  }
}
