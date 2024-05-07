import 'dart:typed_data';

import 'package:bookipedia/app/app_strings.dart';

class GetDocumentFileResponse {
  final Uint8List bytes;
  final String message;
  GetDocumentFileResponse(
      {required this.bytes, this.message = AppStrings.success});

  factory GetDocumentFileResponse.empty({required message}) =>
      GetDocumentFileResponse(message: message, bytes: Uint8List(0));
}
