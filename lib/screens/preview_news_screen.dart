import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:news_app/config/api_config.dart';
import 'package:news_app/constants/app_colors.dart';
import 'package:news_app/constants/app_strings.dart';
import 'package:news_app/models/news_response.dart';
import 'package:url_launcher/url_launcher.dart';

class PreviewNewsScreen extends StatelessWidget {
  const PreviewNewsScreen({super.key, required this.article});

  final Article article;

  @override
  Widget build(BuildContext context) {
    var themeColor = Theme.of(context).colorScheme.primary;

    return Scaffold(
        appBar: AppBar(
          leading: const BackButton(
            color: Colors.white,
          ),
          // IconButton(
          //   icon: Icon(Icons.arrow_back, color: Colors.white),
          //   onPressed: () => Navigator.of(context).pop(),
          // ),
          backgroundColor: themeColor,
        ),
        body: SafeArea(
          child: Container(
            color: AppColors.backgroundColor,
            padding: const EdgeInsets.all(15),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Center(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(5),
                    child: loadImage(),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      article.source!.name ?? '',
                      style: const TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 16),
                    ),
                    Text(
                      DateFormat(AppStrings.dateFormat)
                          .format(DateTime.parse(article.publishedAt!)),
                      style: const TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 16),
                    )
                  ],
                ),
                Container(
                  margin: const EdgeInsets.only(top: 20),
                  child: Text(
                    article.title ?? '',
                    maxLines: 3,
                    style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.normal,
                        color: Colors.black),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 20),
                  child: Text(
                    article.description ?? '',
                    maxLines: 3,
                    style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 20),
                  child: Text(
                    article.content ?? '',
                    maxLines: 7,
                    style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.normal,
                        color: Colors.grey),
                  ),
                ),
                Expanded(
                    child: Align(
                  alignment: Alignment.bottomCenter,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: themeColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                      onPressed: () async {
                        Uri url = Uri.parse(article.url ?? '');
                        if (await canLaunchUrl(url)) {
                          await launchUrl(url);
                        } else {
                          debugPrint('Could not launch $url');
                        }
                      },
                      child: const Text(
                        AppStrings.readFullArticle,
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.normal,
                            color: Colors.white),
                      )),
                ))
              ],
            ),
          ),
        ));
  }

  Image loadImage() {
    Image image;
    try {
      image =
          Image.network(article.urlToImage!, height: 200, fit: BoxFit.fitWidth);
    } catch (e) {
      debugPrint('Image loading failed : ${article.urlToImage}');
      image = Image.network(
        ApiConfig.imageNotFoundPlaceholderUrl,
        height: 200,
        fit: BoxFit.cover,
      );
    }
    return image;
  }
}
