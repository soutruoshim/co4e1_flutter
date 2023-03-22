import 'package:flutter/material.dart';

import '../constants/movie_list_constant.dart';
import '../models/movie_model.dart';
import 'detail_page.dart';

class MyGridViewPage extends StatefulWidget {
  const MyGridViewPage({Key? key}) : super(key: key);

  @override
  State<MyGridViewPage> createState() => _MyGridViewPageState();
}

class _MyGridViewPageState extends State<MyGridViewPage> with AutomaticKeepAliveClientMixin{

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text("My GridView Page"),
        backgroundColor: Colors.grey[900],
      ),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return _buildGridViewBuilder();
  }

  Widget _buildGridViewBuilder() {
    return GridView.builder(
      physics: BouncingScrollPhysics(),
      padding: EdgeInsets.all(5),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 5,
        mainAxisSpacing: 5,
        childAspectRatio: 4 / 6,
      ),
      itemCount: movieList.length,
      itemBuilder: (context, index) {
        return _buildItem(movieList[index]);
      },
    );
  }

  Widget _buildItem(MovieModel item) {
    return InkWell(
      child: Image.network(item.image, fit: BoxFit.cover),
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => DetailPage(item),
          ),
        );
      },
    );
  }

  Widget _buildGridViewExtent() {
    return GridView.extent(
      physics: BouncingScrollPhysics(),
      maxCrossAxisExtent: 100,
      mainAxisSpacing: 10,
      crossAxisSpacing: 5,
      padding: EdgeInsets.all(15),
      childAspectRatio: 4 / 6,
      // x/y
      children: [
        Container(color: Colors.red, width: 30, height: 80),
        Container(color: Colors.blue, width: 50, height: 150),
        Container(color: Colors.green, width: 80, height: 120),
        Container(color: Colors.pink, width: 70, height: 100),
        Container(color: Colors.purple, width: 100, height: 180),
        Container(color: Colors.orange, width: 70, height: 100),
        Container(color: Colors.indigo, width: 100, height: 180),
      ],
    );
  }

  Widget _buildGridViewCount() {
    return GridView.count(
      physics: BouncingScrollPhysics(),
      crossAxisCount: 3,
      mainAxisSpacing: 10,
      crossAxisSpacing: 5,
      padding: EdgeInsets.all(15),
      childAspectRatio: 4 / 6,
      // x/y
      children: [
        Container(color: Colors.red, width: 30, height: 80),
        Container(color: Colors.blue, width: 50, height: 150),
        Container(color: Colors.green, width: 80, height: 120),
        Container(color: Colors.pink, width: 70, height: 100),
        Container(color: Colors.purple, width: 100, height: 180),
        Container(color: Colors.orange, width: 70, height: 100),
        Container(color: Colors.indigo, width: 100, height: 180),
      ],
    );
  }
}
