
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:news_app/screens/error_screen.dart';
import 'package:news_app/screens/preview_news_screen.dart';
import 'package:news_app/screens/search_news_screen.dart';

import 'constants/app_routes.dart';

class NewsAppRouter {
  static GoRouter returnRouter() {
    GoRouter router = GoRouter(
      routes: [
        GoRoute(
            name: AppRoutes.HOME_ROUTE,
            path: '/',
            pageBuilder: (context, state) {
              return MaterialPage(child: SearchNewsScreen());
            }),
        GoRoute(
            name: AppRoutes.PREVIEW_NEWS_ROUTE,
            path: '/preview_news',
            pageBuilder: (context, state) {
              return MaterialPage(child: PreviewNewsScreen());
            }),
      ],
      errorPageBuilder: (context, state) {
          return MaterialPage(child: ErrorScreen());
        }
    );
    return router;
  }
}
