import 'package:bookipedia/app/style/app_text_style.dart';
import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Home screen",
          style: TextStyle(fontSize: FontSize.f20),
        ),
      ),
    );
  }
}
