import 'package:c4e1/localhost_module/logics/article_logic.dart';
import 'package:c4e1/localhost_module/pages/article_splash_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ArticleApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ArticleLogic()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: ArticleSplashPage(),
        theme: ThemeData(
          cardTheme: CardTheme(
            color: Colors.grey[100],
          ),
          appBarTheme: AppBarTheme(
            color: Colors.orange,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(30),
                bottomRight: Radius.circular(30),
              ),
            ),
          ),
          canvasColor: Colors.grey[300],
        ),
      ),
    );
  }
}
