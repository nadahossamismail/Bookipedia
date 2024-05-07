import 'package:bookipedia/presentation_layer/screens/chat_view.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class PdfViewerViewModel {
  OverlayEntry? _overlayEntry;
  final GlobalKey<SfPdfViewerState> pdfViewerKey = GlobalKey();
  late TextEditingController messageController;
  late PdfViewerController pdfViewerController;

  void init() {
    pdfViewerController = PdfViewerController();
    messageController = TextEditingController();
  }

  void dispose() {
    pdfViewerController.dispose();
    messageController.dispose();
  }

  void _showContextMenu(
      BuildContext context, PdfTextSelectionChangedDetails details) {
    final OverlayState overlayState = Overlay.of(context);
    _overlayEntry = OverlayEntry(
        builder: (context) => Positioned(
            top: details.globalSelectedRegion!.center.dy - 55,
            left: details.globalSelectedRegion!.bottomLeft.dx,
            child: ElevatedButton(
              style: const ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(Colors.white),
                  elevation: MaterialStatePropertyAll(10)),
              onPressed: () {
                showChatWindow(context);
                messageController.text =
                    "Copied text: \"${details.selectedText!}\"";
                pdfViewerController.clearSelection();
              },
              child: const Text('Chat', style: TextStyle(fontSize: 17)),
            )));

    overlayState.insert(_overlayEntry!);
  }

  void onSelection(context, PdfTextSelectionChangedDetails details) {
    if (details.selectedText == null && _overlayEntry != null) {
      _overlayEntry!.remove();
      _overlayEntry = null;
    } else if (details.selectedText != null && _overlayEntry == null) {
      _showContextMenu(context, details);
    }
  }

  void showChatWindow(context) {
    showModalBottomSheet(
        showDragHandle: true,
        useSafeArea: true,
        scrollControlDisabledMaxHeightRatio:
            MediaQuery.sizeOf(context).aspectRatio * 1.8,
        context: context,
        builder: (_) {
          return ChatView(messageController: messageController);
        });
  }
}
