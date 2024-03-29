import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:news_app/models/news_response.dart';
import 'package:news_app/screens/error_screen.dart';
import 'package:news_app/screens/preview_news_screen.dart';
import 'package:news_app/screens/search_news_screen.dart';

import '../constants/app_routes.dart';

class NewsAppRouter {
  static GoRouter returnRouter() {
    GoRouter router = GoRouter(
        routes: [
          GoRoute(
              name: AppRoutes.homeRoute,
              path: '/',
              pageBuilder: (context, state) {
                return const MaterialPage(child: SearchNewsScreen());
              }),
          GoRoute(
              name: AppRoutes.previewNewsRoute,
              path: '/preview_news',
              pageBuilder: (context, state) {
                Article article = state.extra as Article;
                return MaterialPage(child: PreviewNewsScreen(article: article));
              }),
        ],
        errorPageBuilder: (context, state) {
          return const MaterialPage(child: ErrorScreen());
        });
    return router;
  }
}
