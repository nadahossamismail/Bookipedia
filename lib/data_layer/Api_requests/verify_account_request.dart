import 'package:bookipedia/app/api_constants.dart';
import 'package:bookipedia/data_layer/models/verify_account/verify_account_request_model.dart';
import 'package:bookipedia/data_layer/models/verify_account/verify_account_response_model.dart';
import 'package:bookipedia/data_layer/network/dio_factory.dart';
import 'package:dio/dio.dart';

class VerifyAccountRequest {
  final VerifyAccountRequestBody opt;
  final dio = DioFactory.getDio();

  VerifyAccountRequest(this.opt);

  Future<VerifyAccountResponse> send() async {
    Response response;
    VerifyAccountResponse verifyAccountResponse;
    var data = verifyAccountRequestModelToJson(opt);

    try {
      response = await dio.post(ApiEndpoints.verifyAccountEndPoint, data: data);
      verifyAccountResponse = VerifyAccountResponse.fromJson(response.data);
      return verifyAccountResponse;
    } catch (error) {
      if (error is DioException) {
        if (error.response!.statusCode == 401) {
          return VerifyAccountResponse.empty("Invaild Verification code");
        }
        return VerifyAccountResponse.empty("failure");
      }
    }
    return VerifyAccountResponse.empty("failure");
  }
}
