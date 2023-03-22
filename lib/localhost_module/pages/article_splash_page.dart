import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../logics/article_logic.dart';
import 'article_page.dart';

class ArticleSplashPage extends StatefulWidget {
  const ArticleSplashPage({Key? key}) : super(key: key);

  @override
  State<ArticleSplashPage> createState() => _ArticleSplashPageState();
}

class _ArticleSplashPageState extends State<ArticleSplashPage> {
  _init() async {
    await context.read<ArticleLogic>().read();

    Future.delayed(Duration(seconds: 1), () {
      if (mounted) {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) => ArticlePage(),
          ),
        );
      }
    });
  }

  @override
  void initState() {
    super.initState();
    _init();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Icon(Icons.article, size: 100),
      ),
    );
  }
}
