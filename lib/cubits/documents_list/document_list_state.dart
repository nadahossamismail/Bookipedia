part of 'document_list_cubit.dart';

sealed class DocumentListState {}

final class DocumentListInitial extends DocumentListState {}

final class DocumentListLoading extends DocumentListState {}

final class DocumentListCompleted extends DocumentListState {}

final class DocumentListFailure extends DocumentListState {
  final String message;
  DocumentListFailure(this.message);
}
