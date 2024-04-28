part of 'delete_document_cubit.dart';

sealed class DeleteDocumentState {}

final class DeleteDocumentInitial extends DeleteDocumentState {}

final class DeleteDocumentFailure extends DeleteDocumentState {
  final String message;
  DeleteDocumentFailure(this.message);
}

final class DeleteDocumentLoading extends DeleteDocumentState {}

final class DeleteDocumentCompleted extends DeleteDocumentState {}
