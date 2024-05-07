part of 'get_document_file_cubit.dart';

sealed class GetDocumentFileState {}

final class GetDocumentFileInitial extends GetDocumentFileState {}

final class GetDocumentFileLoading extends GetDocumentFileState {}

final class GetDocumentFileCompleted extends GetDocumentFileState {
  final Uint8List bytes;
  final String fileName;
  GetDocumentFileCompleted({required this.bytes, required this.fileName});
}

final class GetDocumentFileFailure extends GetDocumentFileState {
  final String message;
  GetDocumentFileFailure(this.message);
}
