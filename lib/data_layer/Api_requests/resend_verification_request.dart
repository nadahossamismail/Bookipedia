import 'package:bookipedia/app/api_constants.dart';
import 'package:bookipedia/data_layer/models/resend_verification/resend_verification_request_model.dart';
import 'package:bookipedia/data_layer/models/resend_verification/resend_verification_response_model.dart';
import 'package:bookipedia/data_layer/network/dio_factory.dart';
import 'package:dio/dio.dart';

class ResendVerificationRequest {
  final ResendVerificationRequestBody email;
  final dio = DioFactory.getDio();

  ResendVerificationRequest(this.email);

  Future<ResendVerificationResponse> send() async {
    Response response;
    var data = resendVerificationRequestBodyToJson(email);
    ResendVerificationResponse resendVerificationResponse;
    try {
      response = await dio.post(ApiEndpoints.resendVerificationEmailEndPoint,
          data: data);
      resendVerificationResponse =
          ResendVerificationResponse.fromJson(response.data);
      return resendVerificationResponse;
    } catch (error) {
      if (error is DioException) {
        return ResendVerificationResponse.empty();
      }
    }
    return ResendVerificationResponse.empty();
  }
}
