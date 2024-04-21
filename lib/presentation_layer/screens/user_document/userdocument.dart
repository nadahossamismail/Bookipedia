import 'dart:io';

import 'package:bookipedia/app/style/app_colors.dart';
import 'package:bookipedia/presentation_layer/widgets/notfoundgif.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

class UserDocumentScreen extends StatelessWidget {
  const UserDocumentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.backgroundDark,
      body: NotFoundGif(
        imageWidth: MediaQuery.of(context).size.width - 40,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Filepicker.pickFile();
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
  }
}

class Filepicker {
  static pickFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();

    if (result != null) {
      File file = File(result.files.single.path!);
    }
  }
}
