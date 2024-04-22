import 'package:bookipedia/app/app_routes.dart';
import 'package:bookipedia/app/style/app_colors.dart';
import 'package:bookipedia/app/style/app_text_style.dart';
import 'package:bookipedia/data_layer/models/BooksModel/allbooks_model.dart';
import 'package:bookipedia/presentation_layer/screens/Library/library_viewmodel.dart';
import 'package:bookipedia/presentation_layer/widgets/horizintalscroll.dart';
import 'package:bookipedia/presentation_layer/widgets/notfoundgif.dart';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gap/gap.dart';

class LibraryScreen extends StatefulWidget {
  const LibraryScreen({super.key});

  @override
  State<LibraryScreen> createState() => _LibraryScreenState();
}

class _LibraryScreenState extends State<LibraryScreen> {
  @override
  void initState() {
    getBooks();
    super.initState();
  }

  getBooks() async {
    x = await LibraryViewModel().getAllBooks();
    setState(() {
      books = x;
    });
  }

  AllBooksModel? books, x;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.backgroundDark,
      appBar: AppBar(
        backgroundColor: ColorManager.backgroundDark,
        elevation: 0,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // SizedBox(
          //   height: MediaQuery.of(context).size.height / 22,
          //   child: const HorizintalScrollList(
          //     padding: 10,
          //     item: Text(
          //       'Category',
          //       style: TextStyle(fontSize: 15, color: Colors.white),
          //     ),
          //     itemscount: 10,
          //   ),
          // ),
          const SizedBox(height: 30),
          Padding(
            padding: const EdgeInsetsDirectional.only(start: 10, end: 10),
            child: InkWell(
              onTap: () {
                Navigator.pushNamed(context, Routes.userDocumentRoute);
              },
              child: Row(
                children: [
                  Text(
                    'Your Documents',
                    style: AppTextStyle.title.copyWith(color: Colors.white),
                  ),
                  const Spacer(),
                  const Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.white,
                  )
                ],
              ),
            ),
          ),
          const Gap(10),
          const NotFoundGif(),
          const Gap(30),
          Padding(
            padding: const EdgeInsetsDirectional.only(start: 10),
            child: Text(
              'Trending Books',
              style: AppTextStyle.title.copyWith(color: Colors.white),
            ),
          ),
          const SizedBox(height: 10),
          SizedBox(
            height: MediaQuery.of(context).size.height / 3.5,
            child: books == null
                ? const Center(child: CircularProgressIndicator())
                : HorizintalScrollList(
                    item: books!,
                    itemscount: books!.length!,
                  ),
          )
        ],
      ),
    );
  }
}
