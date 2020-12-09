import 'package:flutter/material.dart';
import 'package:portal_noticias_app/viewmodels/articles_view_model.dart';
import 'package:portal_noticias_app/widgets/banner_article.dart';

class DetailNewsScreen extends StatelessWidget {
  final ArticlesViewModel article;

  const DetailNewsScreen({Key key, @required this.article}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Row(
          children: [
            CircleAvatar(
              backgroundImage: AssetImage("assets/images/profile.jpeg"),
            ),
            SizedBox(
              width: 10,
            ),
            Container(
              constraints: BoxConstraints(
                maxWidth: 150
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Author",
                    style: TextStyle(color: Colors.grey, fontSize: 12),
                  ),
                  Text(this.article.author ?? "Indefinido")
                ],
              ),
            )
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 30, right: 10),
        child: Column(
          children: [
            SizedBox(
              height: 10,
            ),
            Divider(
              color: Colors.red,
              thickness: 8,
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              this.article.title,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                wordSpacing: 3
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Text(
              this.article.publishedAt,
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey,
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Container(
              height: 200,
              child: BannerArticle(
                imageUrl: this.article.imageUrl
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Text(
              this.article.description,
              style: TextStyle(
                fontSize: 16,
                wordSpacing: 3
              ),
            )
          ],
        ),
      ),
    );
  }
}
