import 'dart:typed_data';
import 'package:bookipedia/app/app_strings.dart';
import 'package:bookipedia/data_layer/Api_requests/get_document_file.dart';
import 'package:bookipedia/data_layer/models/add_document/add_document_response.dart';
import 'package:bookipedia/data_layer/models/get_doc_file/get_doc_file_response.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'get_document_file_state.dart';

class GetDocumentFileCubit extends Cubit<GetDocumentFileState> {
  GetDocumentFileCubit() : super(GetDocumentFileInitial());
  static GetDocumentFileCubit get(context) => BlocProvider.of(context);


  void sendRequest(Document doc) async {
    GetDocumentFileResponse response;
    emit(GetDocumentFileLoading());

    response = await GetDocumentFileRequest(doc.id).send();

    if (response.message == AppStrings.success) {
      var titleWithoutExtension = doc.title.substring(0, doc.title.length - 4);
      emit(GetDocumentFileCompleted(
          bytes: response.bytes, fileName: titleWithoutExtension));
    } else {
      emit(GetDocumentFileFailure(response.message));
    }

  }
}
