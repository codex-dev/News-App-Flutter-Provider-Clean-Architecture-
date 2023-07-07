// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:news_app/constants/app_strings.dart';
import 'package:news_app/models/news_response.dart';
import 'package:news_app/providers/news_provider.dart';
import 'package:news_app/screens/widgets/news_item.dart';
import 'package:news_app/screens/widgets/search_field.dart';

class SearchNewsScreen extends ConsumerWidget {
  const SearchNewsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Color themeColor = Theme.of(context).colorScheme.primary;
    NewsResponse news = ref.watch(newsProvider).newsResponse;
    bool isLoading = ref.watch(newsProvider).isLoading;

    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            AppStrings.NEWS_FEED,
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: themeColor,
          bottom: PreferredSize(
              preferredSize: const Size.fromHeight(70.0),
              child: Container(
                color: themeColor,
                padding: EdgeInsets.all(16.0),
                child: SearchField(),
              )),
        ),
        body: SafeArea(
            child: Container(
                color: const Color(0xffF8F9FD),
                child: isLoading
                    ? Center(
                        child: CircularProgressIndicator(),
                      )
                    : ListView.builder(
                        itemCount: news.articles!.length,
                        itemBuilder: (BuildContext context, int index) {
                          return NewsListItem(article: news.articles![index]);
                        }))));
  }
}
