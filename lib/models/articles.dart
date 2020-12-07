class Article {
  final String title;
  final String author;
  final String description;
  final String urlToImage;
  final String url;
  final String publishedAt;
  final String content;

  Article(this.title, this.author, this.description, this.urlToImage, this.url,
      this.publishedAt, this.content);

  factory Article.fromJson(Map<String, dynamic> json) {
    return Article(json['title'], json['author'], json['description'],
        json['urlToImage'], json['url'], json['publishedAt'], json['content']);
  }
}
