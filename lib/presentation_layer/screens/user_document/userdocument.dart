import 'package:bookipedia/app/style/app_colors.dart';
import 'package:bookipedia/cubits/UserDocument/user_document_cubit.dart';
import 'package:bookipedia/cubits/UserDocument/user_document_state.dart';
import 'package:bookipedia/presentation_layer/widgets/notfoundgif.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserDocumentScreen extends StatelessWidget {
  const UserDocumentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UserDocumentCubit(),
      child: BlocConsumer<UserDocumentCubit, UserDocumentState>(
        listener: (context, state) {},
        builder: (context, state) {
          return Scaffold(
            backgroundColor: ColorManager.backgroundDark,
            body: NotFoundGif(
              imageWidth: MediaQuery.of(context).size.width - 40,
            ),
            floatingActionButton: FloatingActionButton(
              onPressed: () {
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

// class Filepicker {
//   static pickFile() async {
//     FilePickerResult? result = await FilePicker.platform.pickFiles();

//     if (result != null) {
//       File file = File(result.files.single.path!);
//     }
//   }
// }
