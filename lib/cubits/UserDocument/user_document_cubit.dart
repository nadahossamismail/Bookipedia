import 'dart:io';

import 'package:bookipedia/cubits/UserDocument/user_document_state.dart';
import 'package:bookipedia/data_layer/Api_requests/add_document_request.dart';
import 'package:bookipedia/data_layer/models/add_document/add_document_response.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserDocumentCubit extends Cubit<UserDocumentState> {
  UserDocumentCubit() : super(UserDocumentInitial());
  static UserDocumentCubit get(context) => BlocProvider.of(context);
  pickDocument() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();

    if (result != null) {
      File file = File(result.files.single.path!);
      addDocumentsRequest(document: file);
    }
  }

  addDocumentsRequest({required File document}) async {
    AddDocumentResponse response;
    emit(UserDocumentLoading());

    response = await AddDocumentRequest(doc: document).sendRequest();
    if (response.message == "sucess") {
      emit(UserDocumentDone());
    } else {
      emit(UserDocumentFailed());
    }
  }
}
