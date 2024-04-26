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

  factory AddDocumentResponse.empty() => AddDocumentResponse(
        message: "",
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
  final String originalId;
  final String ocrId;
  final String user;
  final DateTime createdAt;
  final String id;
  final int v;

  Document({
    required this.title,
    required this.originalId,
    required this.ocrId,
    required this.user,
    required this.createdAt,
    required this.id,
    required this.v,
  });

  factory Document.empty() => Document(
        title: "",
        originalId: "",
        ocrId: "",
        user: "",
        createdAt: DateTime(2024),
        id: "",
        v: 0,
      );

  factory Document.fromJson(Map<String, dynamic> json) => Document(
        title: json["title"],
        originalId: json["original_id"],
        ocrId: json["ocr_id"],
        user: json["user"],
        createdAt: DateTime.parse(json["createdAt"]),
        id: json["_id"],
        v: json["__v"],
      );
}
