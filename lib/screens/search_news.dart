// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:news_app/constants/app_strings.dart';
import 'package:news_app/screens/widgets/search_field.dart';

class SearchNews extends StatefulWidget {
  const SearchNews({super.key});

  @override
  State<SearchNews> createState() => _SearchNewsState();
}

class _SearchNewsState extends State<SearchNews> {
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
                onPressed: () {},
                child: Text(
                  AppStrings.CANCEL,
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        ),
        Expanded(
            child: Container(
          color: Colors.amber,
        ))
      ]),
    );
  }
}
