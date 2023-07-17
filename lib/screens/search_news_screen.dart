
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:news_app/constants/app_colors.dart';
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
          title: const Text(
            AppStrings.newsFeed,
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: themeColor,
          bottom: PreferredSize(
              preferredSize: const Size.fromHeight(70.0),
              child: Container(
                color: themeColor,
                padding: const EdgeInsets.all(16.0),
                child: const SearchField(),
              )),
        ),
        body: SafeArea(
            child: Container(
                color: AppColors.backgroundColor,
                child: isLoading
                    ? const Center(
                        child: CircularProgressIndicator(),
                      )
                    : ListView.builder(
                        itemCount: news.articles!.length,
                        itemBuilder: (BuildContext context, int index) {
                          return NewsListItem(article: news.articles![index]);
                        }))));
  }
}
