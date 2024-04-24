import 'package:bookipedia/app/app_routes.dart';
import 'package:bookipedia/app/style/app_colors.dart';
import 'package:bookipedia/app/style/app_text_style.dart';
import 'package:bookipedia/presentation_layer/widgets/drawer_content.dart';
import 'package:bookipedia/presentation_layer/widgets/notfoundgif.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.backgroundDark,
      appBar: AppBar(
        backgroundColor: ColorManager.backgroundDark,
        centerTitle: true,
        title: const Text(
          "Home screen",
          style: TextStyle(fontSize: FontSize.f20, color: Colors.white),
        ),
      ),
      drawer: const DrawerContent(),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 30),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsetsDirectional.only(start: 20, end: 20),
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
          ],
        ),
      ),
    );
  }
}
