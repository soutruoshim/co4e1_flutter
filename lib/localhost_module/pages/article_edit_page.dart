import 'package:c4e1/async_module/utils/snacbar_util.dart';
import 'package:c4e1/localhost_module/logics/article_logic.dart';
import 'package:flutter/material.dart';

import '../models/article_model.dart';
import 'package:provider/provider.dart';

class ArticleEditPage extends StatefulWidget {

  final Result item;

  ArticleEditPage(this.item);

  @override
  State<ArticleEditPage> createState() => _ArticleEditPageState();
}

class _ArticleEditPageState extends State<ArticleEditPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: _buildBody(),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      title: Text("Edit Article"),
    );
  }

  GlobalKey<FormState> _formKey = GlobalKey();

  Widget _buildBody() {
    return Form(
      key: _formKey,
      child: ListView(
        padding: EdgeInsets.all(20),
        children: [
          _buildTitleTextField(),
          _buildBodyTextField(),
          _buildImageTextField(),
          _buildEditButton(),
        ],
      ),
    );
  }

  late final _titleCtrl = TextEditingController(text: widget.item.title);

  Widget _buildTitleTextField() {
    return TextFormField(
      decoration: InputDecoration(
        hintText: "Enter title",
      ),
      maxLines: 3,
      controller: _titleCtrl,
      autocorrect: false,
      textCapitalization: TextCapitalization.sentences,
      validator: (text) {
        if (text == null) {
          return "Title is required";
        }
        return null;
      },
    );
  }

  late final _bodyCtrl = TextEditingController(text: widget.item.body);

  Widget _buildBodyTextField() {
    return TextFormField(
      decoration: InputDecoration(
        hintText: "Enter body",
      ),
      controller: _bodyCtrl,
      autocorrect: false,
      maxLines: 8,
      textCapitalization: TextCapitalization.sentences,
      validator: (text) {
        if (text == null) {
          return "Body is required";
        }
        return null;
      },
    );
  }

  late final _imageCtrl = TextEditingController(text: widget.item.image);

  Widget _buildImageTextField() {
    return TextFormField(
      decoration: InputDecoration(
        hintText: "Enter image url",
      ),
      controller: _imageCtrl,
      autocorrect: false,
      maxLines: 3,
      validator: (text) {
        if (text == null) {
          return "Image url is required";
        }
        return null;
      },
    );
  }

  Widget _buildEditButton() {
    return ElevatedButton(
      onPressed: () async{
        if(_formKey.currentState!.validate()){

          Result item = Result(
            aid: widget.item.aid,
            title: _titleCtrl.text.trim(),
            body: _bodyCtrl.text.trim(),
            image: _imageCtrl.text.trim(),
            date: widget.item.date,
          );

          bool success = await context.read<ArticleLogic>().update(item);
          if(success){
            await context.read<ArticleLogic>().read();
            showSnackBar(context, "The record edited");
            Navigator.of(context).pop(item);
          }
          else{
            showSnackBar(context, "Data edition was failed");
          }

        }
        else{
          showSnackBar(context, "Fields are missing");
        }
      },
      child: Text("Update"),
    );
  }
}
