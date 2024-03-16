import 'package:flutter/material.dart';

class AppAlertDialog extends StatelessWidget {
  final String message;
  const AppAlertDialog({super.key, required this.message});

  static void showAlert(context, message) {
    showDialog(
        context: context,
        builder: (_) => AppAlertDialog(
              message: message,
            ));
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      title: Text(
        message,
        textAlign: TextAlign.center,
        style: const TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
      ),
      content: MaterialButton(
          shape:
              BeveledRectangleBorder(borderRadius: BorderRadius.circular(10)),
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text(
            "OK",
            style: TextStyle(fontSize: 20, color: Colors.black),
          )),
    );
  }
}
