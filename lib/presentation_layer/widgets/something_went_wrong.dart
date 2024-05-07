import 'package:bookipedia/app/style/app_text_style.dart';
import 'package:flutter/material.dart';

class SomethingWentWrong extends StatelessWidget {
  final Function() onPressed;
  const SomethingWentWrong({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const SizedBox(
          width: double.infinity,
          child: Text("Something went wrong",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: FontSize.f18)),
        ),
        const SizedBox(
          height: 10,
        ),
        OutlinedButton(
          onPressed: onPressed,
          child: const Text(
            "Try again",
          ),
        )
      ],
    );
  }
}
