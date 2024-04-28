import 'package:bookipedia/app/style/app_text_style.dart';
import 'package:bookipedia/cubits/delete_document/delete_document_cubit.dart';
import 'package:bookipedia/cubits/documents_list/document_list_cubit.dart';
import 'package:bookipedia/cubits/get_document_file/get_document_file_cubit.dart';
import 'package:bookipedia/data_layer/models/get_document_list/document_list_response.dart';
import 'package:bookipedia/presentation_layer/widgets/alert_dialog.dart';
import 'package:bookipedia/presentation_layer/widgets/card.dart';
import 'package:bookipedia/presentation_layer/widgets/dismissible.dart';
import 'package:bookipedia/presentation_layer/widgets/empty_list.dart';
import 'package:bookipedia/presentation_layer/widgets/loading.dart';
import 'package:bookipedia/presentation_layer/widgets/snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserDocsViewModel {
  Widget viewBody(context, state) {
    var documentList = DocumentListCubit.get(context).documentList;
    if (state is DocumentListLoading) {
      return const Loading(color: Colors.grey);
    } else if (state is DocumentListCompleted) {
      return showDocumentsList(documentList);
    } else {
      return const Text("Something wrong went out");
    }
  }

  Widget showDocumentsList(documentList) {
    if (documentList.isNotEmpty) {
      return showNotEmptyList(documentList);
    } else {
      return const EmptyList();
    }
  }

  Widget showNotEmptyList(List<Document> documentList) {
    return BlocListener<DeleteDocumentCubit, DeleteDocumentState>(
      listener: (context, state) =>
          deleteDocumentListener(context, state, documentList),
      child: ListView.builder(
          padding: const EdgeInsets.symmetric(
              horizontal: AppSpacingSizing.s24, vertical: AppSpacingSizing.s12),
          itemCount: documentList.length,
          itemBuilder: (context, index) {
            return documentCard(documentList, index, context);
          }),
    );
  }

  void ensureDeletion(context, documentList, index) {
    Document item = documentList[index];
    showDialog(
        context: context,
        builder: (_) => AppAlertDialog(
            message: "Do you want to delete ${item.title}?",
            isOneOption: false,
            actionTitle: "Delete",
            onAction: () {
              print("entered....");
              Navigator.of(context).pop();
              DeleteDocumentCubit.get(context)
                  .sendRequest(id: item.id, index: index);
              print("sending....");
            }));
  }

  Widget documentCard(List<Document> documentList, int index, context) {
    var doc = documentList[index];
    var title = doc.title;
    var titleWithoutExtension = title.substring(0, title.length - 4);
    return InkWell(
        onTap: () {
          GetDocumentFileCubit.get(context).sendRequest(doc.id);
        },
        onLongPress: () {
          ensureDeletion(context, documentList, index);
        },
        child: DocumentCard(title: titleWithoutExtension));
  }

  void deleteDocumentListener(context, state, List<Document> documentList) {
    if (state is DeleteDocumentFailure) {
      AppSnackBar.showSnackBar(context, state.message);
      DocumentListCubit.get(context).sendRequest();
    } else if (state is DeleteDocumentCompleted) {
      var index = DeleteDocumentCubit.get(context).indexOfToDeletedItem;
      documentList.removeAt(index);
    } else {
      AppSnackBar.showSnackBar(context, "Deleting");
    }
  }
}
