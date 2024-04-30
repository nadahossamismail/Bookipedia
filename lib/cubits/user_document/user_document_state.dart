abstract class UserDocumentState {}

final class UserDocumentInitial extends UserDocumentState {}

final class UserDocumentLoading extends UserDocumentState {}

final class UserDocumentDone extends UserDocumentState {}

final class UserDocumentFailed extends UserDocumentState {
  final String message;

  UserDocumentFailed({required this.message});
}
