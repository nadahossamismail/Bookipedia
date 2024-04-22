import 'package:bookipedia/data_layer/models/BooksModel/allbooks_model.dart';
import 'package:bookipedia/presentation_layer/widgets/networkimage.dart';

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class HorizintalScrollList extends StatelessWidget {
  const HorizintalScrollList({
    super.key,
    required this.item,
    this.padding = 10,
    this.listPadding,
    required this.itemscount,
  });
  final AllBooksModel item;
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
          width: MediaQuery.of(context).size.width / 2.5,
          margin: const EdgeInsets.symmetric(horizontal: 8),
          alignment: Alignment.center,
          padding: EdgeInsets.symmetric(horizontal: padding),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(18),
            border: Border.all(color: Colors.blue, width: 0.6),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            // crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                item.books![index].title ?? '',
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(color: Colors.white, fontSize: 12),
                maxLines: 2,
              ),
              const MaxGap(10),
              NetworkImageHandel(imageUrl: item.books![index].imageUrl ?? ''),
              const MaxGap(10),
              Text(
                item.books![index].description ?? '',
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(color: Colors.amber, fontSize: 12),
                maxLines: 2,
              )
            ],
          ),
        );
      },
      itemCount: itemscount,
    );
  }
}
