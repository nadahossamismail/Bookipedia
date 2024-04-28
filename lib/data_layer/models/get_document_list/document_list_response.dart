import 'dart:convert';

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
      length: 0, documents: [], status: "failure", message: message);

  factory GetUserDocumentsResponse.fromJson(Map<String, dynamic> json) =>
      GetUserDocumentsResponse(
        length: json["length"],
        documents: List<Document>.from(
            json["documents"].map((x) => Document.fromJson(x))),
      );
}

class Document {
  final String id;
  final String title;
  final String originalId;
  final String ocrId;
  final String user;
  final DateTime createdAt;
  final int v;

  Document({
    required this.id,
    required this.title,
    required this.originalId,
    required this.ocrId,
    required this.user,
    required this.createdAt,
    required this.v,
  });

  factory Document.fromJson(Map<String, dynamic> json) => Document(
        id: json["_id"],
        title: json["title"],
        originalId: json["original_id"],
        ocrId: json["ocr_id"],
        user: json["user"],
        createdAt: DateTime.parse(json["createdAt"]),
        v: json["__v"],
      );
}
