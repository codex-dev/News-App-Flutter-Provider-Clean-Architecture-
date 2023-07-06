// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:news_app/constants/app_routes.dart';
import 'package:news_app/constants/app_strings.dart';
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

    return Scaffold(
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
                  GoRouter.of(context)
                      .pushNamed(AppRoutes.PREVIEW_NEWS_ROUTE
                      /*,
                      pathParameters: {
                    'imgUrl': '',
                    'pubDate': '',
                    'author': '',
                    'title': '',
                    'description': '',
                    'content': '',
                    'articleUrl': ''
                  }*/
                  );
                },
                child: Text(
                  AppStrings.CANCEL,
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
              ),
            ],
          ),
        ),
        Expanded(
            child: Container(
        ))
      ]),
    );
  }
}
