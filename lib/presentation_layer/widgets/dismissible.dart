import 'package:flutter/material.dart';

class AppDismissibleItem extends StatelessWidget {
  const AppDismissibleItem(
      {super.key,
      required this.valueKey,
      required this.child,
      required this.onDismissed});
  final Key valueKey;
  final Widget child;
  final Function(DismissDirection)? onDismissed;

  @override
  Widget build(BuildContext context) {
    return Dismissible(
        key: valueKey,
        direction: DismissDirection.endToStart,
        onDismissed: onDismissed,
        background: Container(
          margin: const EdgeInsets.all(7),
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 245, 102, 92),
            borderRadius: BorderRadius.circular(5),
          ),
          padding: const EdgeInsets.all(15),
          child: const Row(mainAxisAlignment: MainAxisAlignment.end, children: [
            Text("Delete", style: TextStyle(fontSize: 21, color: Colors.white)),
            Icon(
              Icons.delete,
              color: Colors.white,
            )
          ]),
        ),
        child: child);
  }
}
