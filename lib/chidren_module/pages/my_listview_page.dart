import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../constants/movie_list_constant.dart';
import '../models/movie_model.dart';
import 'detail_page.dart';

class MyListViewPage extends StatefulWidget {
  const MyListViewPage({Key? key}) : super(key: key);

  @override
  State<MyListViewPage> createState() => _MyListViewPageState();
}

class _MyListViewPageState extends State<MyListViewPage> with AutomaticKeepAliveClientMixin{

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text("Movie 24"),
        backgroundColor: Colors.blueGrey[900],
      ),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return _buildMainListView();
  }

  Widget _buildMainListView(){
    return ListView(
      children: [
        _buildStory(),
        _buildListViewBuilder(),
        _buildSlideShow(),
        _buildGridViewBuilder(),
      ],
    );
  }

  Widget _buildStory() {
    return SizedBox(
      height: 300,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemCount: movieList.length,
        itemBuilder: (context, index) {
          return _buildStoryItem(movieList[index]);
        },
      ),
    );
  }

  Widget _buildStoryItem(MovieModel item) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => DetailPage(item),
          ),
        );
      },
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 5, vertical: 10),
        width: 150,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            image: DecorationImage(
              image: NetworkImage(item.image),
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }


  Widget _buildGridViewBuilder() {
    return GridView.builder(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      padding: EdgeInsets.all(5),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 5,
        mainAxisSpacing: 5,
        childAspectRatio: 4 / 6,
      ),
      itemCount: movieList.length,
      itemBuilder: (context, index) {
        return _buildGridItem(movieList[index]);
      },
    );
  }

  Widget _buildGridItem(MovieModel item) {
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

  Widget _buildSlideShow(){
    List<MovieModel> movieList2 = movieList.reversed.toList();
    return SizedBox(
      height: 300,
      child: PageView.builder(
          physics: BouncingScrollPhysics(),
          itemCount: movieList2.length,
          itemBuilder: (context, index){
            return _buildPageItem(movieList2[index]);
          }),
    );
  }

  Widget _buildPageItem(MovieModel item) {
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

  Widget _buildListViewBuilder() {
    return ListView.builder(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: movieList.length,
      itemBuilder: (context, index) {
        return _buildItem(movieList[index]);
      },
    );
  }

  Widget _buildItem(MovieModel item) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => DetailPage(item),
          ),
        );
      },
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 10),
        child: Column(
          children: [
            Container(
              height: 400,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
                image: DecorationImage(
                  image: NetworkImage(item.image),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.all(20),
              alignment: Alignment.center,
              child: Text(item.title),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }


}
