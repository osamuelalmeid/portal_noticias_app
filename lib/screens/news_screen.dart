import 'package:flutter/material.dart';
import 'package:portal_noticias_app/viewmodels/articles_list_view_model.dart';
import 'package:portal_noticias_app/widgets/news_grid.dart';
import 'package:provider/provider.dart';

class NewsScreen extends StatefulWidget {
  @override
  _NewsScreenState createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
  @override
  void initState() {
    super.initState();
    Provider.of<ArticlesListViewModel>(context, listen: false).topHeadLines();
  }

  @override
  Widget build(BuildContext context) {
    var listViewModel = Provider.of<ArticlesListViewModel>(context);

    return Scaffold(
      appBar: AppBar(
        actions: [
          Icon(Icons.more_vert)
        ],
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 30),
              child: Text(
                "Notícias",
                style: TextStyle(
                  fontSize: 50
                ),
              ),
            ),
            Divider(
              color: Color(0xffFF8A30),
              height: 40,
              thickness: 8,
              indent: 30,
              endIndent: 30,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 30, top: 15, bottom: 15),
              child: Text(
                "Mais recentes",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20
                ),
              ),
            ),
            Expanded(
             child: GridNews(
                articles: listViewModel.articles,
             )
            )
          ]
        ),
      )
    );
  }
}
