part of 'get_document_file_cubit.dart';

sealed class GetDocumentFileState {}

final class GetDocumentFileInitial extends GetDocumentFileState {}

final class GetDocumentFileLoading extends GetDocumentFileState {}

final class GetDocumentFileCompleted extends GetDocumentFileState {}

final class GetDocumentFileFailure extends GetDocumentFileState {}
