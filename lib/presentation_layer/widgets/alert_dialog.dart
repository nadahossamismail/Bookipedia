import 'package:bookipedia/app/style/app_colors.dart';
import 'package:bookipedia/app/style/app_text_style.dart';
import 'package:flutter/material.dart';

class AppAlertDialog extends StatelessWidget {
  final String message;
  final bool isOneOption;
  final String? actionTitle;
  final Function()? onAction;
  const AppAlertDialog({
    super.key,
    required this.message,
    this.isOneOption = true,
    this.actionTitle,
    this.onAction,
  });

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
        buttonPadding: const EdgeInsets.symmetric(horizontal: 12),
        actionsAlignment: MainAxisAlignment.center,
        contentPadding: const EdgeInsets.symmetric(
            vertical: AppSpacingSizing.s32, horizontal: 24),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        content: Text(
          message,
          textAlign: TextAlign.center,
          style: const TextStyle(
              fontSize: FontSize.f20, fontWeight: FontWeight.w400),
        ),
        actions: [
          isOneOption
              ? ActionButton(
                  onPressed: () => Navigator.of(context).pop(),
                  title: "OK",
                  color: ColorManager.primary)
              : ActionButton(
                  onPressed: () => Navigator.of(context).pop(),
                  title: "cancle",
                  color: Colors.grey),
          ActionButton(
              onPressed: () => onAction,
              title: actionTitle ?? "OK",
              color: ColorManager.primary)
        ]);
  }
}

class ActionButton extends StatelessWidget {
  final Function() onPressed;
  final String title;
  final Color color;
  const ActionButton({
    super.key,
    required this.onPressed,
    required this.title,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
        shape: BeveledRectangleBorder(borderRadius: BorderRadius.circular(10)),
        onPressed: onPressed,
        child: Text(title, style: TextStyle(fontSize: 20, color: color)));
  }
}
