import 'package:bookipedia/app/style/app_text_style.dart';
import 'package:flutter/material.dart';

class AppCard extends StatelessWidget {
  const AppCard({super.key, required this.title, required this.onIconPressed});
  final String title;
  final Function() onIconPressed;
  @override
  Widget build(BuildContext context) {
    return Card(
        elevation: 2,
        margin: const EdgeInsets.symmetric(
            vertical: AppSpacingSizing.s8, horizontal: AppSpacingSizing.s8),
        child: Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: AppSpacingSizing.s24,
                vertical: AppSpacingSizing.s8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                      fontSize: FontSize.f20, fontWeight: FontWeight.w400),
                ),
                IconButton(
                    onPressed: onIconPressed,
                    icon: const Icon(
                      Icons.delete,
                      size: AppSpacingSizing.s24,
                    ))
              ],
            )));
  }
}
