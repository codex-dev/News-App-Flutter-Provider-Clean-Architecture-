import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:news_app/constants/app_strings.dart';
import 'package:news_app/screens/widgets/load_image.dart';

import '../../constants/app_routes.dart';
import '../../models/news_response.dart';

class NewsListItem extends StatelessWidget {
  final Article article;

  const NewsListItem({Key? key, required this.article}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 165,
        child: Container(
            padding: const EdgeInsets.all(10),
            margin: const EdgeInsets.only(top: 7.5, bottom: 7.5),
            height: 130,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 1,
                  blurRadius: 5,
                  offset: const Offset(0, 3), // changes position of shadow
                ),
              ],
            ),
            child: InkWell(
                onTap: () {
                  loadPreviewNewsScreen(context);
                },
                child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      ClipRRect(
                          borderRadius: BorderRadius.circular(5),
                          child: LoadImage(
                            url: article.urlToImage,
                            height: 100,
                            width: 100,
                            fit: BoxFit.cover,
                          )),
                      const SizedBox(
                        width: 10,
                      ),
                      Expanded(
                          flex: 1,
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  article.title ?? '',
                                  maxLines: 2,
                                  style: const TextStyle(
                                      fontSize: 18,
                                      color: Colors.black,
                                      fontWeight: FontWeight.normal),
                                ),
                                SizedBox.fromSize(
                                  size: const Size.fromHeight(5),
                                ),
                                Text(
                                  article.content ?? '',
                                  maxLines: 2,
                                  style: const TextStyle(
                                      fontSize: 16,
                                      color: Colors.grey,
                                      fontWeight: FontWeight.normal),
                                ),
                                SizedBox.fromSize(
                                  size: const Size.fromHeight(5),
                                ),
                                Text(
                                  DateFormat(AppStrings.dateFormat).format(
                                      DateTime.parse(article.publishedAt!)),
                                  style: const TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14),
                                )
                              ]))
                    ]))));
  }

  void loadPreviewNewsScreen(BuildContext context) {
    GoRouter.of(context).pushNamed(AppRoutes.previewNewsRoute, extra: article);
  }
}
