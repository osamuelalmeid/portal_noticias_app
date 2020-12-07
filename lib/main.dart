import 'package:flutter/material.dart';
import 'package:portal_noticias_app/screens/news_screen.dart';
import 'package:portal_noticias_app/viewmodels/articles_list_view_model.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Portal Noticias App',
      theme: ThemeData(
        scaffoldBackgroundColor: Color(0xffFEFDFD),
        appBarTheme: AppBarTheme(
          color: Color(0xffFEFDFD),
          elevation: 0,
          textTheme: TextTheme(
            title: TextStyle(
              color: Colors.black
            )
          ),
          actionsIconTheme: IconThemeData(
            color: Colors.black,
          )
        )
      ),
      home: MultiProvider(providers: [
        ChangeNotifierProvider(create: (_) => ArticlesListViewModel())
      ], child: NewsScreen()),
    );
  }
}
