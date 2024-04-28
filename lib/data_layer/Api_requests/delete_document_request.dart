import 'package:bookipedia/app/api_constants.dart';
import 'package:bookipedia/data_layer/models/delete_document/delete_document_response.dart';
import 'package:bookipedia/data_layer/network/dio_factory.dart';
import 'package:bookipedia/data_layer/network/enum_handler.dart';
import 'package:dio/dio.dart';

class DeleteDocumentRequest {
  final String id;
  final dio = DioFactory.getDio();

  DeleteDocumentRequest(this.id);

  Future<DeleteDocumentResponse> send() async {
    Response response;
    try {
      response = await dio.delete("${ApiEndpoints.deleteDocument}$id",
          options: Options(headers: ApiHeaders.tokenHeader));

      return DeleteDocumentResponse(status: "success", message: "Deleted");
    } catch (error) {
      var handler = ErrorHandler.handle(error);

      return DeleteDocumentResponse(
          status: "failure", message: handler.failure.message);
    }
  }
}
