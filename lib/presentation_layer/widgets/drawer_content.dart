import 'package:bookipedia/app/app_routes.dart';
import 'package:bookipedia/app/style/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class DrawerContent extends StatelessWidget {
  const DrawerContent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: ColorManager.primary,
      child: Padding(
        padding: EdgeInsets.symmetric(
            vertical: MediaQuery.of(context).size.height / 7,
            horizontal: MediaQuery.of(context).size.width / 7),
        child: Column(
          children: [
            CircleAvatar(
              radius: MediaQuery.of(context).size.height / 12,
              backgroundColor: ColorManager.backgroundDark,
            ),
            Gap(MediaQuery.of(context).size.height / 15),
            InkWell(
              onTap: () => Navigator.pushNamed(context, Routes.libraryRoute),
              child: Row(
                children: [
                  Icon(
                    Icons.book,
                    size: MediaQuery.of(context).size.height / 30,
                  ),
                  const Gap(15),
                  Text(
                    'Library',
                    style: TextStyle(
                        fontSize: MediaQuery.of(context).size.height / 40),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
