import 'package:dio/dio.dart';
import 'package:portal_noticias_app/models/articles.dart';

class WebService {
  var dio = new Dio();

  Future<List<Article>> fetchTopHeadLines() async {
    String url =
        "https://newsapi.org/v2/top-headlines?country=br&apiKey=1b35d0fa970f491dbdd40e5cbb51a5dc";

    final response = await dio.get(url);

    if (response.statusCode == 200) {
      final result = response.data;
      Iterable list = result['articles'];
      return list.map((article) => Article.fromJson(article)).toList();
    } else {
      throw Exception("Failed to get news");
    }
  }
}
