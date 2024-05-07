import 'dart:convert';
import 'package:bookipedia/app/app_strings.dart';
import 'package:bookipedia/data_layer/models/add_document/add_document_response.dart';

GetUserDocumentsResponse documentsListDartFromJson(String str) =>
    GetUserDocumentsResponse.fromJson(json.decode(str));

class GetUserDocumentsResponse {
  final int length;
  final List<Document> documents;
  final String? status;
  final String? message;

  GetUserDocumentsResponse(
      {required this.length,
      required this.documents,
      this.status,
      this.message});
  factory GetUserDocumentsResponse.empty(message) => GetUserDocumentsResponse(
      length: 0, documents: [], status: AppStrings.failure, message: message);

  factory GetUserDocumentsResponse.fromJson(Map<String, dynamic> json) =>
      GetUserDocumentsResponse(
        length: json["length"],
        documents: List<Document>.from(
            json["documents"].map((x) => Document.fromJson(x))),
      );
}
