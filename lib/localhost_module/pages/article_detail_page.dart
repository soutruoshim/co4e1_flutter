import 'package:c4e1/localhost_module/logics/article_logic.dart';
import 'package:c4e1/localhost_module/pages/article_edit_page.dart';
import 'package:flutter/material.dart';

import '../models/article_model.dart';
import 'package:provider/provider.dart';

class ArticleDetailPage extends StatefulWidget {
  Result item;

  ArticleDetailPage(this.item);

  @override
  State<ArticleDetailPage> createState() => _ArticleDetailPageState();
}

class _ArticleDetailPageState extends State<ArticleDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: _buildBody(),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      title: Text("Detail Page"),
      actions: [
        IconButton(
          onPressed: () async{
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => ArticleEditPage(widget.item),
              ),
            ).then((value) {
              setState(() {
                widget.item = value;
              });
            });
          },
          icon: Icon(Icons.edit),
        ),
        IconButton(
          onPressed: () async {
            bool deleted = await _showDeleteDialog() ?? false;
            if (deleted) {
              bool success =
                  await context.read<ArticleLogic>().delete(widget.item);
              if (success) {
                await context.read<ArticleLogic>().read();
                Navigator.of(context).pop();
              }
            }
          },
          icon: Icon(Icons.delete),
        ),
      ],
    );
  }

  Future<bool?> _showDeleteDialog() {
    return showDialog<bool?>(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Delete"),
          content: Text("Do you want to delete it?"),
          actions: [
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop(false);
              },
              child: Text("No"),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(true);
              },
              child: Text("Delete"),
            ),
          ],
        );
      },
    );
  }

  Widget _buildBody() {
    return Container(
      alignment: Alignment.topCenter,
      child: ListView(
        children: [
          _buildTitle(),
          _buildImage(),
          _buildTextBody(),
        ],
      ),
    );
  }

  Widget _buildImage() {
    return Image.network(
      widget.item.image!,
      fit: BoxFit.cover,
    );
  }

  Widget _buildTitle() {
    return Container(
      alignment: Alignment.center,
      padding: EdgeInsets.all(10),
      child: Text(
        "${widget.item.title!}",
        style: TextStyle(
          fontSize: 22,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _buildTextBody() {
    return Container(
      alignment: Alignment.center,
      padding: EdgeInsets.all(10),
      child: Text(
        "${widget.item.body!}",
        style: TextStyle(
          fontSize: 18,
        ),
      ),
    );
  }
}
