import 'dart:io';

import 'package:bookipedia/app/api_constants.dart';
import 'package:bookipedia/data_layer/network/dio_factory.dart';
import 'package:bookipedia/main.dart';
import 'package:dio/dio.dart';
import 'package:http_parser/http_parser.dart';

class AddDocumentRequest {
  final File doc;

  AddDocumentRequest({required this.doc});
  documentToJson() async {
    final String newPath = doc.path.split('/').last;
    var data = FormData.fromMap({
      'file': await MultipartFile.fromFile(doc.path,
          filename: newPath, contentType: MediaType('document', 'pdf'))
    });
    return data;
  }

  sendRequest() async {
    final dio = DioFactory.getDio();
    var data = documentToJson();
    try {
      var response = await dio.post(ApiEndpoints.addDocument,
          data: data, options: Options(headers: ApiHeaders.tokenHeader));
      return response.data;
    } on DioException catch (e) {
      print(e.response);
    }
  }
}
