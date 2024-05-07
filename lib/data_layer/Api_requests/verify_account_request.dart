import 'package:bookipedia/app/api_constants.dart';
import 'package:bookipedia/app/app_strings.dart';
import 'package:bookipedia/data_layer/models/verify_account/verify_account_request_model.dart';
import 'package:bookipedia/data_layer/models/verify_account/verify_account_response_model.dart';
import 'package:bookipedia/data_layer/network/dio_factory.dart';
import 'package:bookipedia/data_layer/network/enum_handler.dart';
import 'package:dio/dio.dart';

class VerifyAccountRequest {
  final String otp;
  final dio = DioFactory.getDio();

  VerifyAccountRequest(this.otp);

  Future<VerifyAccountResponse> send() async {
    Response response;
    VerifyAccountResponse verifyAccountResponse;
    var data = VerifyAccountRequestBody(otp: otp).toJson();

    try {
      response = await dio.post(ApiEndpoints.verifyAccountEndPoint, data: data);
      verifyAccountResponse = VerifyAccountResponse.fromJson(response.data);
      return verifyAccountResponse;
    } catch (error) {
      var failure = ErrorHandler.handle(error).failure;
      var message =
          failure.code == 401 ? AppStrings.notValidOtp : failure.message;
      return VerifyAccountResponse.empty(status: message);
    }
  }
}
