import 'package:bookipedia/app/style/app_text_style.dart';
import 'package:flutter/material.dart';

class DocumentCard extends StatelessWidget {
  const DocumentCard({super.key, required this.title});
  final String title;
  @override
  Widget build(BuildContext context) {
    return Card(
        elevation: 2,
        margin: const EdgeInsets.symmetric(vertical: AppSpacingSizing.s8),
        child: Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: AppSpacingSizing.s24,
                vertical: AppSpacingSizing.s16),
            child: Row(
              children: [
                Text(
                  title,
                  style: const TextStyle(
                      fontSize: FontSize.f20, fontWeight: FontWeight.w400),
                ),
              ],
            )));
  }
}
