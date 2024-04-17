import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class PdfViewerScreen extends StatefulWidget {
  const PdfViewerScreen({super.key});

  @override
  State<PdfViewerScreen> createState() => _PdfViewerScreenState();
}

class _PdfViewerScreenState extends State<PdfViewerScreen> {
  PdfViewerController pdfController = PdfViewerController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SfPdfViewer.asset(
          'assets/أكتر من 60 سؤال شائع في ال Flutter interview.pdf',
          controller: pdfController,
          onAnnotationAdded: (annotation) => {
                print(
                    '${annotation.author} ${annotation.name} ${annotation.subject} '),
              }),
    );
  }
}
