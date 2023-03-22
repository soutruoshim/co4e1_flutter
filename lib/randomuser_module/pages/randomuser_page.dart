import 'package:c4e1/randomuser_module/pages/randomuser_detail_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../logics/randomuser_logic.dart';
import '../models/randomuser_model.dart';

class RandomUserPage extends StatefulWidget {
  const RandomUserPage({Key? key}) : super(key: key);

  @override
  State<RandomUserPage> createState() => _RandomUserPageState();
}

class _RandomUserPageState extends State<RandomUserPage> {
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
    );
  }

  Widget _buildBody() {
    String? error = context.watch<RandomUserLogic>().error;
    if (error != null) {
      debugPrint("Error: $error");
      return _buildError();
    }

    RandomUserModel? data = context.watch<RandomUserLogic>().randomUserModel;
    if (data == null) {
      return SizedBox();
    }

    return _buildDisplay(data.results!);
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
              await context.read<RandomUserLogic>().read();
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
        await context.read<RandomUserLogic>().read();
      },
      child: ListView.builder(
        controller: _scrollController,
        physics: BouncingScrollPhysics(),
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
        leading: Image.network(item.picture!.large!),
        title:
            Text("${item.name!.title} ${item.name!.first} ${item.name!.last}"),
        subtitle: Text("${item.location!.state}, ${item.location!.country}"),
        trailing: Text("${item.nat}"),
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => RandomUserDetailPage(item),
            ),
          );
        },
      ),
    );
  }
}
