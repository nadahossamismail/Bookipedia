import 'package:bookipedia/app/app_strings.dart';

DeleteDocumentResponse deleteDocumentResponseFromJson(
        Map<String, dynamic> json) =>
    DeleteDocumentResponse.fromJson(json);

class DeleteDocumentResponse {
  final String status;
  final String message;

  DeleteDocumentResponse({
    required this.status,
    required this.message,
  });

  factory DeleteDocumentResponse.empty(message) => DeleteDocumentResponse(
        status: AppStrings.failure,
        message: message,
      );

  factory DeleteDocumentResponse.fromJson(Map<String, dynamic> json) =>
      DeleteDocumentResponse(
        status: json["status"],
        message: json["message"],
      );
}
