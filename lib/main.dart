// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:news_app/screens/search_news.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'News App',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
      ),
      home: SearchNews(),
    );
  }
}
