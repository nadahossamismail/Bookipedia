import 'dart:io';

import 'package:bookipedia/cubits/UserDocument/user_document_state.dart';
import 'package:bookipedia/data_layer/Api_requests/add_document_request.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserDocumentCubit extends Cubit<UserDocumentState> {
  UserDocumentCubit() : super(UserDocumentInitial());
  static UserDocumentCubit get(context) => BlocProvider.of(context);
  addDocuments({required File document}) async {
    var response = await AddDocumentRequest(doc: document).sendRequest();
    print(response);
  }
}
//await MultipartFile.fromFile(image.path,
             // filename: newPath, contentType: MediaType('image', 'jpg'))