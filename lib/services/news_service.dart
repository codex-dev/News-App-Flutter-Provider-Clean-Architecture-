import 'package:dio/dio.dart';
import 'package:news_app/config/api_config.dart';

class NewsService {
  final Dio _dio = Dio(
      BaseOptions(baseUrl: ApiConfig.baseUrl, responseType: ResponseType.json));

  fetchNews(String query) async {
    var response = await _dio.get("v2/everything?"
        "q=$query"
        "&searchIn=title"
        "&language=en"
        "&sortBy=publishedAt"
        "&pageSize=100"
        "&page=1"
        "&apiKey=094abddfda1944fb87d868677f3005ee");

    return response.data;
  }
}
