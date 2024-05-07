import 'dart:typed_data';
import 'package:bookipedia/app/style/app_colors.dart';
import 'package:bookipedia/presentation_layer/screens/pdf_view/pdf_viewer_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class PdfViewer extends StatefulWidget {
  const PdfViewer({super.key, required this.bytes, required this.title});
  final Uint8List bytes;
  final String title;

  @override
  State<PdfViewer> createState() => _PdfViewerState();
}

class _PdfViewerState extends State<PdfViewer> {
  PdfViewerViewModel pdfViewerViewModel = PdfViewerViewModel();

  @override
  void initState() {
    pdfViewerViewModel.init();
    super.initState();
  }

  @override
  void dispose() {
    pdfViewerViewModel.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          title: Text(widget.title),
          centerTitle: true,
          actions: <Widget>[
            Padding(
              padding: const EdgeInsets.only(right: 16.0),
              child: IconButton(
                icon: const Icon(
                  Icons.format_list_bulleted_rounded,
                  color: Colors.grey,
                ),
                onPressed: () {
                  pdfViewerViewModel.pdfViewerKey.currentState
                      ?.openBookmarkView();
                },
              ),
            ),
          ]),
      body: SfPdfViewer.memory(
        widget.bytes,
        onTextSelectionChanged: (details) =>
            pdfViewerViewModel.onSelection(context, details),
        key: pdfViewerViewModel.pdfViewerKey,
        controller: pdfViewerViewModel.pdfViewerController,
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: ColorManager.primary,
        onPressed: () => pdfViewerViewModel.showChatWindow(context),
        child: const Icon(
          Icons.chat_rounded,
          color: Colors.white,
        ),
      ),
    );
  }
}
