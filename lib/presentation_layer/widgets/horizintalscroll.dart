import 'package:flutter/material.dart';

class HorizintalScrollList extends StatelessWidget {
  const HorizintalScrollList({
    super.key,
    required this.item,
    this.padding = 0,
    this.listPadding,
    required this.itemscount,
  });
  final Widget item;
  final double padding;
  final int itemscount;
  final EdgeInsetsGeometry? listPadding;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: listPadding,
      shrinkWrap: true,
      scrollDirection: Axis.horizontal,
      itemBuilder: (BuildContext context, int index) {
        return Container(
          //height: 20,
          margin: const EdgeInsets.symmetric(horizontal: 8),
          alignment: Alignment.center,
          padding: EdgeInsets.symmetric(horizontal: padding),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(18),
            border: Border.all(color: Colors.blue, width: 0.6),
          ),
          child: item,
        );
      },
      itemCount: itemscount,
    );
  }
}
