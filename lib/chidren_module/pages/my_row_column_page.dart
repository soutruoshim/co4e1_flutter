import 'package:flutter/material.dart';

class MyRowColumnPage extends StatefulWidget {
  const MyRowColumnPage({Key? key}) : super(key: key);

  @override
  State<MyRowColumnPage> createState() => _MyRowColumnPageState();
}

class _MyRowColumnPageState extends State<MyRowColumnPage> with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: _buildBody(),
      // bottomNavigationBar: _buildBottom(),
    );
  }

  Widget _buildBottom() {
    return BottomAppBar(
      color: Colors.blueGrey[100],
      child: Row(
        children: [
          IconButton(onPressed: () {}, icon: Icon(Icons.home)),
          IconButton(onPressed: () {}, icon: Icon(Icons.person)),
          IconButton(onPressed: () {}, icon: Icon(Icons.play_arrow)),
          Spacer(),
          IconButton(onPressed: () {}, icon: Icon(Icons.more_horiz)),
        ],
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      backgroundColor: Colors.black,
      title: _buildMenu(),
      flexibleSpace: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.black, Colors.pink],
          ),
        ),
      ),
    );
  }

  Widget _buildMenu() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      physics: BouncingScrollPhysics(),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          InkWell(
            child: Text("Latest"),
            onTap: () {
              print("Latest click");
            },
          ),
          SizedBox(width: 20),
          InkWell(
            child: Text("Popular"),
            onTap: () {
              print("Popular click");
            },
          ),
          SizedBox(width: 20),
          InkWell(
            child: Text("Trending"),
            onTap: () {
              print("Trending click");
            },
          ),
          SizedBox(width: 20),
          InkWell(
            child: Text("Movies"),
            onTap: () {
              print("Latest click");
            },
          ),
          SizedBox(width: 20),
          InkWell(
            child: Text("TV Shows"),
            onTap: () {
              print("Popular click");
            },
          ),
          SizedBox(width: 20),
          InkWell(
            child: Text("Top"),
            onTap: () {
              print("Trending click");
            },
          ),
        ],
      ),
    );
  }

  Widget _buildBody() {
    return Container(
      alignment: Alignment.center,
      child: _buildRow(),
    );
  }

  Widget _buildRow() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      physics: BouncingScrollPhysics(),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            color: Colors.red,
            width: 230,
            height: 480,
            margin: EdgeInsets.all(20),
            child: Image.network(
              "https://cdn.vox-cdn.com/thumbor/bSTm-UcWgZchGXVz0AosS4RYy8g=/1400x1400/filters:format(jpeg)/cdn.vox-cdn.com/uploads/chorus_asset/file/23434598/DrStrange2_Payoff_1_Sht_v6_Lg.jpeg",
              fit: BoxFit.cover,
            ),
          ),
          VerticalDivider(
            color: Colors.grey,
            thickness: 1,
          ),
          Container(
            color: Colors.blue,
            width: 250,
            height: 450,
            margin: EdgeInsets.all(20),
            child: Image.network(
              "https://www.mcgilltribune.com/wp-content/uploads/2022/03/ign.com-1.jpeg",
              fit: BoxFit.cover,
            ),
          ),
          VerticalDivider(
            color: Colors.grey,
            thickness: 1,
          ),
          Container(
            color: Colors.greenAccent,
            width: 280,
            height: 420,
            margin: EdgeInsets.all(20),
            child: Image.network(
              "https://nextbigwhat.com/wp-content/uploads/2021/12/spider_man_no_way_home_india_1638191040.webp",
              fit: BoxFit.cover,
            ),
          ),
          VerticalDivider(
            color: Colors.grey,
            thickness: 1,
          ),
          Container(
            color: Colors.pink,
            width: 270,
            height: 480,
            margin: EdgeInsets.all(20),
            child: Image.network(
              "https://media1.popsugar-assets.com/files/thumbor/_Rrjw5u5qeqlO8Zznc0TskZB_8k/fit-in/1024x1024/filters:format_auto-!!-:strip_icc-!!-/2018/04/30/868/n/1922283/1f2e59ed5ae773b06f2879.82877284_/i/Does-Iron-Man-Die-Avengers-Infinity-War.jpg",
              fit: BoxFit.cover,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildColumn() {
    return Container(
      color: Colors.orange.withOpacity(0.2), //for debug
      child: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Container(color: Colors.red, width: 30, height: 80),
            Container(color: Colors.blue, width: 50, height: 150),
            Container(color: Colors.green, width: 80, height: 120),
            Container(color: Colors.pink, width: 70, height: 100),
            Container(color: Colors.purple, width: 100, height: 180),
            Container(color: Colors.orange, width: 70, height: 100),
            Container(color: Colors.indigo, width: 100, height: 180),
          ],
        ),
      ),
    );
  }
}
