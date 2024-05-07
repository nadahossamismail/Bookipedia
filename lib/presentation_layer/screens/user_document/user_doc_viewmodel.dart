import 'package:bookipedia/app/style/app_text_style.dart';

import 'package:bookipedia/cubits/get_document_file/get_document_file_cubit.dart';

import 'package:bookipedia/cubits/user_document/user_document_state.dart';
import 'package:bookipedia/cubits/delete_document/delete_document_cubit.dart';
import 'package:bookipedia/cubits/documents_list/document_list_cubit.dart';
import 'package:bookipedia/data_layer/models/add_document/add_document_response.dart';
import 'package:bookipedia/presentation_layer/widgets/alert_dialog.dart';
import 'package:bookipedia/presentation_layer/widgets/card.dart';
import 'package:bookipedia/presentation_layer/widgets/empty_list.dart';
import 'package:bookipedia/presentation_layer/widgets/loading.dart';
import 'package:bookipedia/presentation_layer/widgets/snack_bar.dart';
import 'package:bookipedia/presentation_layer/widgets/something_went_wrong.dart';
import 'package:flutter/material.dart';

class UserDocsViewModel {
  Widget viewBody({
    required BuildContext context,
    required UserDocumentState userDocumentState,
    required DocumentListState documentListState,
    required DeleteDocumentState deleteDocumentState,
  }) {
    var documentList = DocumentListCubit.get(context).documentList;

    if (documentListState is DocumentListLoading ||
        userDocumentState is UserDocumentLoading ||
        deleteDocumentState is DeleteDocumentLoading) {
      return const Loading(color: Colors.grey);
    } else if (documentListState is DocumentListCompleted) {
      return showDocumentsList(documentList);
    }

    return SomethingWentWrong(
        onPressed: () => DocumentListCubit.get(context).sendRequest());

  }

  Widget showDocumentsList(documentList) {
    if (documentList.isNotEmpty) {
      return showNotEmptyList(documentList);
    } else {
      return const EmptyList();
    }
  }

  Widget showNotEmptyList(List<Document> documentList) {
    return ListView.builder(
        padding: const EdgeInsets.symmetric(
            horizontal: AppSpacingSizing.s24, vertical: AppSpacingSizing.s12),
        itemCount: documentList.length,
        itemBuilder: (context, index) {
          return documentCard(documentList, index, context);
        });

  }

  void deleteDocumentListener(context, state) {
    if (state is DeleteDocumentFailure) {
      AppSnackBar.showSnackBar(context, state.message);
    } else if (state is DeleteDocumentCompleted) {
      DocumentListCubit.get(context).sendRequest();
    }
  }

  Widget documentCard(List<Document> documentList, int index, context) {
    var doc = documentList[index];
    var title = doc.title;
    var titleWithoutExtension = title.substring(0, title.length - 4);
    return InkWell(
        onTap: () => diplayDocument(doc, context),
        child: AppCard(
          title: titleWithoutExtension,
          onIconPressed: () => confirmDeletion(context, documentList, index),
        ));
  }

  void diplayDocument(Document doc, context) async {
    GetDocumentFileCubit.get(context).sendRequest(doc);
  }

  void confirmDeletion(context, documentList, index) {
    Document item = documentList[index];
    showDialog(
        context: context,
        builder: (_) => AppAlertDialog(
            message: "Are you sure you want to delete ${item.title}?",
            isOneOption: false,
            actionTitle: "delete",
            onAction: () {
              DeleteDocumentCubit.get(context)
                  .sendRequest(id: item.id, index: index);
              Navigator.of(context).pop();
            }));

  }
}
