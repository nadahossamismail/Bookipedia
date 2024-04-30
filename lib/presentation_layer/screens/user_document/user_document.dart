import 'package:bookipedia/app/style/app_colors.dart';
import 'package:bookipedia/app/style/app_text_style.dart';
import 'package:bookipedia/cubits/delete_document/delete_document_cubit.dart';
import 'package:bookipedia/cubits/user_document/user_document_cubit.dart';
import 'package:bookipedia/cubits/user_document/user_document_state.dart';
import 'package:bookipedia/cubits/documents_list/document_list_cubit.dart';
import 'package:bookipedia/presentation_layer/screens/user_document/user_doc_viewmodel.dart';
import 'package:bookipedia/presentation_layer/widgets/snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserDocumentScreen extends StatefulWidget {
  const UserDocumentScreen({super.key});

  @override
  State<UserDocumentScreen> createState() => _UserDocumentScreenState();
}

class _UserDocumentScreenState extends State<UserDocumentScreen> {
  UserDocsViewModel userDocsViewModel = UserDocsViewModel();
  @override
  void initState() {
    DocumentListCubit.get(context).sendRequest();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
        listeners: [
          BlocListener<UserDocumentCubit, UserDocumentState>(
            listener: (context, state) {
              if (state is UserDocumentDone) {
                DocumentListCubit.get(context).sendRequest();
              } else if (state is UserDocumentFailed) {
                AppSnackBar.showSnackBar(context, state.message);
              }
            },
          ),
          BlocListener<DeleteDocumentCubit, DeleteDocumentState>(
            listener: (context, state) =>
                userDocsViewModel.deleteDocumentListener(context, state),
          ),
          BlocListener<DocumentListCubit, DocumentListState>(
            listener: (context, state) {
              if (state is DocumentListFailure) {
                AppSnackBar.showSnackBar(context, state.message);
              }
            },
          ),
        ],
        child: Scaffold(
          body: Builder(builder: (context) {
            var userDocumentState = context.watch<UserDocumentCubit>().state;
            var documentListState = context.watch<DocumentListCubit>().state;
            var deleteDocState = context.watch<DeleteDocumentCubit>().state;

            return userDocsViewModel.viewBody(
                context: context,
                userDocumentState: userDocumentState,
                documentListState: documentListState,
                deleteDocumentState: deleteDocState);
          }),
          appBar: AppBar(
            iconTheme: const IconThemeData(size: AppSpacingSizing.s28),
            actions: const [
              Padding(
                padding: EdgeInsets.only(right: AppSpacingSizing.s24),
                child: Icon(Icons.search),
              )
            ],
            centerTitle: true,
            title: const Text("Your Documents"),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () async {
              UserDocumentCubit.get(context).pickDocument();
            },
            backgroundColor: ColorManager.primary,
            shape: const RoundedRectangleBorder(
                borderRadius:
                    BorderRadius.all(Radius.circular(AppSpacingSizing.s24))),
            child: const Icon(
              Icons.add,
              size: 25,
              color: Colors.white,
            ),
          ),
        ));
  }
}
