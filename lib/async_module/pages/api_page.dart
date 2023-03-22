import 'package:c4e1/async_module/logics/post_logic.dart';
import 'package:c4e1/async_module/models/post_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../utils/snacbar_util.dart';

class ApiPage extends StatefulWidget {
  const ApiPage({Key? key}) : super(key: key);

  @override
  State<ApiPage> createState() => _ApiPageState();
}

class _ApiPageState extends State<ApiPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: _buildBody(),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      title: Text("API Page"),
      actions: [
        IconButton(
          onPressed: () {
            showSnackBar(context, "Hello");
          },
          icon: Icon(Icons.visibility),
        ),
      ],
    );
  }

  Widget _buildBody(){
    String? error = context.watch<PostLogic>().error;
    if(error != null){
      debugPrint("Error: $error");
      return Center(child: Text("Something went wrong"),);
    }

    List<PostModel>? postList = context.watch<PostLogic>().postList;
    if(postList == null){
      return SizedBox();
    }

    return _buildDisplay(postList);
  }

  Widget _buildDisplay(List<PostModel>? items) {
    if (items == null) {
      return SizedBox();
    }

    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (context, index) {
        return _buildItem(items[index]);

      },
    );
  }

  Widget _buildItem(PostModel post){
    return Card(
      child: ListTile(
        leading: Text("${post.id}"),
        title: Text("${post.title}"),
        subtitle: Text("${post.body}"),
        trailing: Text("${post.userId}"),
      ),
    );
  }
}
