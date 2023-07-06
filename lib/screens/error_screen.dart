import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:news_app/constants/app_routes.dart';

class ErrorScreen extends StatelessWidget {
  const ErrorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        title: Text('Error Screen'),
      ),
      body: Center(
        child: ElevatedButton(
            onPressed: () {
              GoRouter.of(context).pushNamed(AppRoutes.HOME_ROUTE);
            },
            child: Text('Go to Home page')),
      ),
    );
  }
}
