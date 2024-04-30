import 'package:bookipedia/app/style/app_colors.dart';
import 'package:bookipedia/app/style/app_text_style.dart';
import 'package:bookipedia/data_layer/models/BooksModel/allbooks_model.dart';
import 'package:bookipedia/presentation_layer/screens/Library/library_viewmodel.dart';
import 'package:bookipedia/presentation_layer/widgets/horizintalscroll.dart';
import 'package:flutter/material.dart';

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
          const SizedBox(height: 30),
          Padding(
            padding: const EdgeInsetsDirectional.only(start: 10),
            child: Text(
              'Library',
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
