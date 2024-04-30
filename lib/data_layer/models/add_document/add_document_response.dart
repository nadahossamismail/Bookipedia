import 'dart:convert';

AddDocumentResponse addDocumentResponseDartFromJson(String str) =>
    AddDocumentResponse.fromJson(json.decode(str));

class AddDocumentResponse {
  final String message;
  final Document document;

  AddDocumentResponse({
    required this.message,
    required this.document,
  });

  factory AddDocumentResponse.empty(message) => AddDocumentResponse(
        message: message,
        document: Document.empty(),
      );

  factory AddDocumentResponse.fromJson(Map<String, dynamic> json) =>
      AddDocumentResponse(
        message: json["message"],
        document: Document.fromJson(json["document"]),
      );
}

class Document {
  final String title;
  final String id;

  Document({
    required this.id,
    required this.title,
  });

  factory Document.empty() => Document(
        id: "",
        title: "",
      );

  factory Document.fromJson(Map<String, dynamic> json) => Document(
        title: json["title"],
        id: json["_id"],
      );
}
