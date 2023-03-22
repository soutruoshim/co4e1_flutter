import 'package:c4e1/async_module/utils/snacbar_util.dart';
import 'package:c4e1/localhost_module/logics/article_logic.dart';
import 'package:flutter/material.dart';

import '../models/article_model.dart';
import 'package:provider/provider.dart';

class ArticleAddNewPage extends StatefulWidget {
  const ArticleAddNewPage({Key? key}) : super(key: key);

  @override
  State<ArticleAddNewPage> createState() => _ArticleAddNewPageState();
}

class _ArticleAddNewPageState extends State<ArticleAddNewPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: _buildBody(),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      title: Text("Add New Article"),
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
          _buildAddButton(),
        ],
      ),
    );
  }

  final _titleCtrl = TextEditingController();

  Widget _buildTitleTextField() {
    return TextFormField(
      decoration: InputDecoration(
        hintText: "Enter title",
      ),
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

  final _bodyCtrl = TextEditingController();

  Widget _buildBodyTextField() {
    return TextFormField(
      decoration: InputDecoration(
        hintText: "Enter body",
      ),
      controller: _bodyCtrl,
      autocorrect: false,
      textCapitalization: TextCapitalization.sentences,
      validator: (text) {
        if (text == null) {
          return "Body is required";
        }
        return null;
      },
    );
  }

  final _imageCtrl = TextEditingController();

  Widget _buildImageTextField() {
    return TextFormField(
      decoration: InputDecoration(
        hintText: "Enter image url",
      ),
      controller: _imageCtrl,
      autocorrect: false,
      validator: (text) {
        if (text == null) {
          return "Image url is required";
        }
        return null;
      },
    );
  }

  Widget _buildAddButton() {
    return ElevatedButton(
      onPressed: () async{
        if(_formKey.currentState!.validate()){

          Result item = Result(
            aid: "",
            title: _titleCtrl.text.trim(),
            body: _bodyCtrl.text.trim(),
            image: _imageCtrl.text.trim(),
            date: DateTime.now().toIso8601String(),
          );

          debugPrint(item.toJson().toString());

          bool success = await context.read<ArticleLogic>().insert(item);
          if(success){
            _titleCtrl.clear();
            _bodyCtrl.clear();
            _imageCtrl.clear();
            await context.read<ArticleLogic>().read();
            showSnackBar(context, "New record inserted");
          }
          else{
            showSnackBar(context, "Data insertion was failed");
          }

        }
        else{
          showSnackBar(context, "Fields are missing");
        }
      },
      child: Text("Add"),
    );
  }
}
