// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:news_app/constants/app_strings.dart';
import 'package:news_app/models/news_article.dart';

class PreviewNewsScreen extends StatelessWidget {
  const PreviewNewsScreen({super.key, required this.article });
  final Article article;

  @override
  Widget build(BuildContext context) {
    var themeColor = Theme.of(context).colorScheme.primary;

    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
          color: Colors.white,
        ),
        // IconButton(
        //   icon: Icon(Icons.arrow_back, color: Colors.white),
        //   onPressed: () => Navigator.of(context).pop(),
        // ),
        centerTitle: true,
        title: Text(
          "News Preview",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: themeColor,
      ),
      body: Container(
        padding: EdgeInsets.all(15),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(5),
                child: Image.network(
                    article.imgUrl,
                    height: 200,
                    fit: BoxFit.fitWidth),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  article.source,
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 16),
                ),
                Text(
                  article.pubDate,
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 16),
                )
              ],
            ),
            Container(
              margin: EdgeInsets.only(top: 15),
              child: Text(
                article.title,
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.normal,
                    color: Colors.black),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 15),
              child: Text(
                article.description,
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 15),
              child: Text(
                article.content,
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.normal,
                    color: Colors.grey),
              ),
            ),
            Expanded(
                child: Align(
              alignment: Alignment.bottomCenter,
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(backgroundColor: themeColor),
                  onPressed: () {},
                  child: Text(
                    AppStrings.READ_FULL_ARTICLE,
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.normal,
                        color: Colors.white),
                  )),
            ))
          ],
        ),
      ),
    );
  }
}
