import 'package:flutter/material.dart';
import 'package:portal_noticias_app/models/articles.dart';
import 'package:portal_noticias_app/services/web_service.dart';
import 'articles_view_model.dart';

enum LoadingStatus { completed, searching, empty }

class ArticlesListViewModel with ChangeNotifier {
  LoadingStatus loadingStatus = LoadingStatus.empty;
  List<ArticlesViewModel> articles = List<ArticlesViewModel>();

  void topHeadLines() async {
    List<Article> newArticles = await WebService().fetchTopHeadLines();
    loadingStatus = LoadingStatus.searching;
    notifyListeners();

    this.articles = newArticles
        .map((article) => ArticlesViewModel(article: article))
        .toList();

    if (this.articles.isEmpty) {
      loadingStatus = LoadingStatus.empty;
    } else {
      loadingStatus = LoadingStatus.completed;
    }
    notifyListeners();
  }
}
