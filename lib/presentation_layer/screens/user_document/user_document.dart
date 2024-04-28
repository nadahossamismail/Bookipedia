import 'package:bookipedia/app/style/app_colors.dart';
import 'package:bookipedia/app/style/app_text_style.dart';
import 'package:bookipedia/cubits/UserDocument/user_document_cubit.dart';
import 'package:bookipedia/cubits/UserDocument/user_document_state.dart';
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

  void rebuildList() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UserDocumentCubit, UserDocumentState>(
      listener: (context, state) {
        if (state is UserDocumentDone) {
          AppSnackBar.showSnackBar(context, "Added your pdf!");
          DocumentListCubit.get(context).sendRequest();
        }
      },
      builder: (context, state) {
        return Scaffold(
          body: BlocConsumer<DocumentListCubit, DocumentListState>(
              listener: (context, state) {
                if (state is DocumentListFailure) {
                  Navigator.pop(context);
                  AppSnackBar.showSnackBar(context, state.message);
                }
              },
              builder: userDocsViewModel.viewBody),
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
        );
      },
    );
  }
}
