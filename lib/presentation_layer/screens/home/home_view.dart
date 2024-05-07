import 'package:bookipedia/data_layer/network/dio_factory.dart';
import 'package:bookipedia/presentation_layer/screens/Library/libraryscreen.dart';
import 'package:bookipedia/presentation_layer/screens/profile/profile_view.dart';
import 'package:bookipedia/presentation_layer/screens/user_books/user_books.dart';
import 'package:bookipedia/presentation_layer/screens/user_document/user_document.dart';
import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int currentIndex = 1;
  var pages = [
    const LibraryScreen(),
    const UserDocumentScreen(),
    const UserBooksView(),
    const ProfileView(),
  ];
  List<String> pageTitle = [
    "Library",
    "Your documents",
    "Your books",
    "Profile"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(pageTitle[currentIndex]),
          actions: currentIndex == 1
              ? [
                  Padding(
                    padding: const EdgeInsets.only(right: 16.0),
                    child: IconButton(
                        onPressed: () async {
                          var dio = DioFactory.getDio();
                          var fileName = "flutter.pdf";
                          await dio.download(
                              "https://cdn.syncfusion.com/content/PDFViewer/flutter-succinctly.pdf",
                              "/storage/emulated/0/Download/$fileName");
                          print("downloaded");
                        },
                        icon: const Icon(Icons.download)),
                  )
                ]
              : null,
        ),
        body: pages[currentIndex],
        bottomNavigationBar: NavigationBar(
            labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
            selectedIndex: currentIndex,
            onDestinationSelected: (val) => setState(() {
                  currentIndex = val;
                }),
            destinations: const [
              NavigationDestination(
                  icon: Icon(Icons.collections_bookmark, size: 30),
                  label: "library"),
              NavigationDestination(
                  icon: Icon(Icons.picture_as_pdf, size: 30), label: "docs"),
              NavigationDestination(
                  icon: Icon(Icons.book, size: 30), label: "books"),
              NavigationDestination(
                  icon: Icon(Icons.person, size: 30), label: "profile"),
            ]));
  }
}
