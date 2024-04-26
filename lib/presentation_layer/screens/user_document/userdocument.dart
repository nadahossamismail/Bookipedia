import 'package:bookipedia/app/style/app_colors.dart';
import 'package:bookipedia/cubits/UserDocument/user_document_cubit.dart';
import 'package:bookipedia/cubits/UserDocument/user_document_state.dart';

import 'package:bookipedia/presentation_layer/widgets/snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserDocumentScreen extends StatelessWidget {
  const UserDocumentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UserDocumentCubit(),
      child: BlocConsumer<UserDocumentCubit, UserDocumentState>(
        listener: (context, state) {
          if (state is UserDocumentDone) {
            AppSnackBar.showSnackBar(context, "Added your pdf!");
          }
        },
        builder: (context, state) {
          return Scaffold(
            backgroundColor: ColorManager.backgroundDark,
            // body: NotFoundGif(
            //   imageWidth: MediaQuery.of(context).size.width - 40,
            // ),
            floatingActionButton: FloatingActionButton(
              onPressed: () async {
                UserDocumentCubit.get(context).pickDocument();
              },
              backgroundColor: ColorManager.primary,
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(35))),
              child: Icon(
                Icons.note_add,
                size: 25,
                color: ColorManager.backgroundDark,
              ),
            ),
          );
        },
      ),
    );
  }
}
