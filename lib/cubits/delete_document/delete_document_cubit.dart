import 'package:bookipedia/app/app_strings.dart';
import 'package:bookipedia/data_layer/Api_requests/delete_document_request.dart';
import 'package:bookipedia/data_layer/models/delete_document/delete_document_response.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'delete_document_state.dart';

class DeleteDocumentCubit extends Cubit<DeleteDocumentState> {
  DeleteDocumentCubit() : super(DeleteDocumentInitial());

  static DeleteDocumentCubit get(context) => BlocProvider.of(context);

  void sendRequest({required id, required index}) async {
    DeleteDocumentResponse response;
    emit(DeleteDocumentLoading());

    response = await DeleteDocumentRequest(id).send();


    if (response.status == AppStrings.success) {
      
      emit(DeleteDocumentCompleted());
    } else {
      emit(DeleteDocumentFailure(response.message));
    }
  }
}
