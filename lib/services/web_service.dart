import 'package:dio/dio.dart';
import 'package:portal_noticias_app/models/articles.dart';
import 'package:portal_noticias_app/utils/constants.dart';

class WebService {
  var dio = new Dio();

  Future<List<Article>> fetchTopHeadLines() async {

    final response = await dio.get(Constants.URL);

    if (response.statusCode == 200) {
      final result = response.data;
      Iterable list = result['articles'];
      return list.map((article) => Article.fromJson(article)).toList();
    } else {
      throw Exception("Failed to get news");
    }
  }
}
