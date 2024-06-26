import 'package:bookipedia/app/app_strings.dart';
import 'package:bookipedia/data_layer/Api_requests/get_user_documents_request.dart';
import 'package:bookipedia/data_layer/models/add_document/add_document_response.dart';
import 'package:bookipedia/data_layer/models/user_documents/document_list_response.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'document_list_state.dart';

class DocumentListCubit extends Cubit<DocumentListState> {
  DocumentListCubit() : super(DocumentListInitial());

  static DocumentListCubit get(context) => BlocProvider.of(context);

  List<Document> documentList = [];

  void sendRequest() async {
    GetUserDocumentsResponse response;

    emit(DocumentListLoading());

    response = await GetUserDocumentsRequest().send();

    if (response.status == AppStrings.failure) {
      emit(DocumentListFailure(response.message!));
    } else {
      documentList = response.documents;
      emit(DocumentListCompleted());
    }
  }
}
