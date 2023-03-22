import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../constants/movie_list_constant.dart';
import '../models/movie_model.dart';
import 'detail_page.dart';

class MyPageViewPage extends StatefulWidget {
  const MyPageViewPage({Key? key}) : super(key: key);

  @override
  State<MyPageViewPage> createState() => _MyPageViewPageState();
}

class _MyPageViewPageState extends State<MyPageViewPage> with AutomaticKeepAliveClientMixin{

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: _buildBody(),
      // bottomNavigationBar: _buildBottom(),
    );
  }

  Widget _buildBottom() {
    return BottomAppBar(
      color: Colors.grey[900],
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.home,
                color: Colors.white,
              )),
          IconButton(
              onPressed: () {}, icon: Icon(Icons.person, color: Colors.white)),
          IconButton(
              onPressed: () {}, icon: Icon(Icons.add, color: Colors.white)),
          IconButton(
              onPressed: () {},
              icon: Icon(Icons.play_arrow, color: Colors.white)),
          IconButton(
              onPressed: () {},
              icon: Icon(Icons.more_horiz, color: Colors.white)),
        ],
      ),
    );
  }

  Widget _buildBody() {
    return Stack(
      alignment: Alignment.center,
      children: [
        _buildPageViewBuilder(),
        Positioned(
          top: 40,
          child: _buildFollowingForYou(),
        ),
      ],
    );
  }

  Widget _buildFollowingForYou() {
    return Container(
      child: Row(
        children: [
          TextButton(
            onPressed: () {},
            child: Text(
              "Following",
              style: TextStyle(color: Colors.white, fontSize: 18),
            ),
          ),
          TextButton(
            onPressed: () {},
            child: Text(
              "For You",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPageViewBuilder() {
    return PageView.builder(
      physics: BouncingScrollPhysics(),
      scrollDirection: Axis.vertical,
      itemCount: movieList.length,
      itemBuilder: (context, index) {
        return _buildItem(movieList[index]);
      },
    );
  }

  Widget _buildItem(MovieModel item) {
    return Stack(
      children: [
        Positioned.fill(
          child: InkWell(
            child: Image.network(item.image, fit: BoxFit.cover),
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => DetailPage(item),
                ),
              );
            },
          ),
        ),
        Positioned(
          bottom: 20,
          right: 10,
          child: _buildIconBox(),
        ),
      ],
    );
  }

  Widget _buildIconBox() {
    return Container(
      child: Column(
        children: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.person, color: Colors.white),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.favorite, color: Colors.white),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.comment, color: Colors.white),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.bookmark, color: Colors.white),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(CupertinoIcons.arrowshape_turn_up_right_fill,
                color: Colors.white),
          ),
        ],
      ),
    );
  }


}
