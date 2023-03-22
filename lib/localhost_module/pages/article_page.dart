import 'package:c4e1/localhost_module/models/article_model.dart';
import 'package:c4e1/localhost_module/pages/article_addnew_page.dart';
import 'package:c4e1/localhost_module/pages/article_detail_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../logics/article_logic.dart';

class ArticlePage extends StatefulWidget {
  const ArticlePage({Key? key}) : super(key: key);

  @override
  State<ArticlePage> createState() => _ArticlePageState();
}

class _ArticlePageState extends State<ArticlePage> {
  bool _showIcon = false;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels >= 500) {
        setState(() {
          _showIcon = true;
        });
      } else {
        setState(() {
          _showIcon = false;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: _buildBody(),
      floatingActionButton: _showIcon ? _buildFloating() : null,
    );
  }

  Widget _buildFloating() {
    return FloatingActionButton(
      onPressed: () {
        _scrollController.animateTo(
          0,
          duration: Duration(milliseconds: 400),
          curve: Curves.easeInOut,
        );
      },
      child: Icon(Icons.arrow_upward),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      title: Text("RandomUser Page"),
      actions: [
        IconButton(
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => ArticleAddNewPage(),
              ),
            );
          },
          icon: Icon(Icons.add),
        ),
      ],
    );
  }

  Widget _buildBody() {
    String? error = context.watch<ArticleLogic>().error;
    if (error != null) {
      debugPrint("Error: $error");
      return _buildError();
    }

    ArticleModel? data = context.watch<ArticleLogic>().articleModel;
    if (data == null) {
      return SizedBox();
    }

    return _buildDisplay(data.results);
  }

  Widget _buildError() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Something went wrong",
            style: TextStyle(fontSize: 20),
          ),
          ElevatedButton(
            onPressed: () async {
              await context.read<ArticleLogic>().read();
            },
            child: Text("RETRY"),
          ),
        ],
      ),
    );
  }

  final _scrollController = ScrollController();

  Widget _buildDisplay(List<Result> items) {
    return RefreshIndicator(
      onRefresh: () async {
        await context.read<ArticleLogic>().read();
      },
      child: ListView.builder(
        controller: _scrollController,
        // physics: BouncingScrollPhysics(),
        itemCount: items.length,
        itemBuilder: (context, index) {
          return _buildItem(items[index]);
        },
      ),
    );
  }

  Widget _buildItem(Result item) {
    return Card(
      child: ListTile(
        title: Text("${item.title}"),
        subtitle: Image.network(item.image!),
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => ArticleDetailPage(item),
            ),
          );
        },
      ),
    );
  }
}
