import 'dart:io';

import 'package:bookipedia/cubits/UserDocument/user_document_state.dart';
import 'package:bookipedia/data_layer/Api_requests/add_document_request.dart';
import 'package:dio/dio.dart';
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
    emit(UserDocumentLoading());
    try {
      var response = await AddDocumentRequest(doc: document).sendRequest();
      print(response);
      emit(UserDocumentDone());
    } on DioException catch (e) {
      print(e.response);
      emit(UserDocumentFailed());
    }
  }
}
//await MultipartFile.fromFile(image.path,
             // filename: newPath, contentType: MediaType('image', 'jpg'))