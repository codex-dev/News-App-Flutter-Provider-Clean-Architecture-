// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:news_app/constants/app_routes.dart';
import 'package:news_app/constants/app_strings.dart';
import 'package:news_app/models/news_response.dart';
import 'package:news_app/screens/widgets/search_field.dart';

class SearchNewsScreen extends StatefulWidget {
  const SearchNewsScreen({super.key});

  @override
  State<SearchNewsScreen> createState() => _SearchNewsScreenState();
}

class _SearchNewsScreenState extends State<SearchNewsScreen> {
  @override
  Widget build(BuildContext context) {
    var themeColor = Theme.of(context).colorScheme.primary;

    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          AppStrings.NEWS_FEED,
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: themeColor,
      ),
      body: Column(children: [
        Container(
          color: themeColor,
          padding: EdgeInsets.all(16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              SearchField(),
              // SizedBox(
              //   width: 10,
              // ),
              TextButton(
                onPressed: () {
                  loadPreviewScreen();
                },
                child: Text(
                  AppStrings.CANCEL,
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
              ),
            ],
          ),
        ),
        Expanded(child: Container())
      ]),
    ));
  }

  void loadPreviewScreen() {
    Article article = Article(
        urlToImage: '',
            // 'https://static1.anpoimages.com/wordpress/wp-content/uploads/2023/06/use-iphone-secret-trackpad.jpg',
        // 'https://i.ibb.co/rywTgwQ/concepto-ios-17.jpg', // 'https://upload.wikimedia.org/wikipedia/commons/thumb/3/37/African_Bush_Elephant.jpg/800px-African_Bush_Elephant.jpg',
        source: Source(name: 'Android Police'),
        publishedAt: '',//'2023-07-15T22:11:55Z',
        title: 'This is the title of the news article',
        description: 'A brief description of the news article',
        content: 'Here goes the content of the article',
        url: '');
            // 'https://www.androidpolice.com/apple-iphone-secret-trackpad-how-to/');
    GoRouter.of(context)
        .pushNamed(AppRoutes.PREVIEW_NEWS_ROUTE, extra: article);
  }
}
