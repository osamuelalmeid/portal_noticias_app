import 'package:intl/intl.dart';
import 'package:portal_noticias_app/models/articles.dart';

class ArticlesViewModel {
  Article _article;

  ArticlesViewModel({Article article}) : _article = article;

  String get title {
    return _article.title;
  }

  String get description {
    return _article.description;
  }

  String get imageUrl {
    return _article.urlToImage;
  }

  String get url {
    return _article.url;
  }

  String get author {
    return _article.author;
  }

  String get publishedAt {
    final datetime = DateFormat("yyyy-mm-ddTHH:mm:ssZ").parse(_article.publishedAt, true);
    return DateFormat.yMMMMEEEEd("en-us").format(datetime).toString();
  }
}
