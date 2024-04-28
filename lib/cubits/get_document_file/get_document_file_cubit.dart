import 'package:bookipedia/data_layer/Api_requests/get_document_file.dart';

import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'get_document_file_state.dart';

class GetDocumentFileCubit extends Cubit<GetDocumentFileState> {
  GetDocumentFileCubit() : super(GetDocumentFileInitial());
  static GetDocumentFileCubit get(context) => BlocProvider.of(context);

  void sendRequest(id) async {
    // LoginResponse response;
    Response response;
    emit(GetDocumentFileLoading());

    response = await GetDocumentFileRequest(id).send();
    print("response from cubit:${response.data}");

    // if (response.status == "success") {

    //   emit(GetDocumentFileCompleted());
    // } else {
    //   emit(GetDocumentFileCompleted());
    // }
  }
}
