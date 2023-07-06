// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:news_app/screens/preview_news_screen.dart';
import 'package:news_app/screens/search_news_screen.dart';

import 'app_route_config.dart';

void main() {
  runApp(NewsApp());
}

class NewsApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: NewsAppRouter.returnRouter(),
      debugShowCheckedModeBanner: false,
      // routeInformationParser:
      //     NewsAppRouter.returnRouter(false).routeInformationParser,
      // routerDelegate: NewsAppRouter.returnRouter(false).routerDelegate,
      title: 'News App',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
      ),
      // home: SearchNews(),
    );
  }
}
