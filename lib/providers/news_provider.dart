import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:news_app/services/news_service.dart';

import '../models/news_response.dart';

part 'news_provider.freezed.dart';

@freezed
class NewsState with _$NewsState {
  const factory NewsState(
      {@Default(true) bool isLoading,
      required NewsResponse newsResponse}) = _NewsState;

  const NewsState._();
}

class NewsNotifier extends StateNotifier<NewsState> {
  NewsNotifier() : super(NewsState(newsResponse: NewsResponse(articles: []))) {
    state = state.copyWith(
        isLoading: false); // make progressbar disappear in the begining
  }

  loadSearchedNews(String query) async {
    state = state.copyWith(isLoading: true);
    final response = await NewsService().fetchNews(query);
    final news = NewsResponse.fromJson(response);
    state = state.copyWith(newsResponse: news, isLoading: false);
  }
}

final newsProvider =
    StateNotifierProvider<NewsNotifier, NewsState>((ref) => NewsNotifier());
