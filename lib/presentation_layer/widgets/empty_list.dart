import 'package:bookipedia/app/style/app_text_style.dart';
import 'package:flutter/material.dart';

class EmptyList extends StatelessWidget {
  const EmptyList({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
        child: SizedBox(
      width: 250,
      child: Text(
        "Upload a pdf and start reading right away!",
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: FontSize.f18, color: Colors.grey),
      ),
    ));
  }
}
