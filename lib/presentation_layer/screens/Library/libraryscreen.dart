import 'package:bookipedia/app/app_routes.dart';
import 'package:bookipedia/app/style/app_colors.dart';
import 'package:bookipedia/app/style/app_text_style.dart';
import 'package:bookipedia/presentation_layer/widgets/horizintalscroll.dart';
import 'package:bookipedia/presentation_layer/widgets/notfoundgif.dart';

import 'package:flutter/material.dart';

class LibraryScreen extends StatelessWidget {
  const LibraryScreen({super.key});

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
          SizedBox(
            height: MediaQuery.of(context).size.height / 22,
            child: const HorizintalScrollList(
              padding: 10,
              item: Text(
                'Category',
                style: TextStyle(fontSize: 15, color: Colors.white),
              ),
              itemscount: 10,
            ),
          ),
          const SizedBox(height: 30),
          Padding(
            padding: const EdgeInsetsDirectional.only(start: 10, end: 10),
            child: InkWell(
              onTap: () {
                Navigator.pushNamed(context, Routes.userDocumentScreen);
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
          const SizedBox(height: 10),
          const NotFoundGif(),
          const SizedBox(height: 30),
          Padding(
            padding: const EdgeInsetsDirectional.only(start: 10),
            child: Text(
              'Trending Books',
              style: AppTextStyle.title.copyWith(color: Colors.white),
            ),
          ),
          const SizedBox(height: 10),
          SizedBox(
            height: 150,
            child: HorizintalScrollList(
              item: ClipRRect(
                borderRadius: BorderRadius.circular(18),
                child: Image.asset(
                  'assets/images/4d2892d7925b42e965fa42d047f0a433.jpeg',
                  fit: BoxFit.cover,
                  width: 100,
                  height: 150,
                ),
              ),
              itemscount: 10,
            ),
          )
        ],
      ),
    );
  }
}
