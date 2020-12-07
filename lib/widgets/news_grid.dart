import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:portal_noticias_app/viewmodels/articles_view_model.dart';

class GridNews extends StatelessWidget {
  final List<ArticlesViewModel> articles;

  GridNews({this.articles});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
        ),
        itemBuilder: (context, index) {
          var article = articles[index];
          return GridTile(
            child: CachedNetworkImage(
              imageUrl: article.imageUrl,
              imageBuilder: (context, imageProvider) {
                return Container(
                  margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    image: DecorationImage(
                        image: imageProvider, fit: BoxFit.cover)),
                );
              },
            placeholder: (context, url) {
              return Center(
                child: CircularProgressIndicator(),
              );
            },
            errorWidget: (context, url, error) {
              return Container();
            },
          ),
          footer: Container(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Text(
              article.title,
              style: TextStyle(
                fontWeight: FontWeight.bold
              ),
              maxLines: 1,
            ),
          ),
          );
        },
        itemCount: this.articles.length,
      ),
    );
  }
}
