import 'package:bookipedia/app/api_constants.dart';
import 'package:bookipedia/data_layer/network/dio_factory.dart';
import 'package:bookipedia/data_layer/network/enum_handler.dart';
import 'package:dio/dio.dart';

class GetDocumentFileRequest {
  final String id;
  final dio = DioFactory.getDio();

  GetDocumentFileRequest(this.id);

  send() async {
    Response response;

    try {
      response = await dio.get("${ApiEndpoints.getDocumentFile}$id",
          options: Options(headers: ApiHeaders.tokenHeader));
      print("response from file req:${response.data}");
    } catch (error) {
      var handler = ErrorHandler.handle(error);
      print("handler:${handler.failure.message}");
    }
  }
}
