import 'package:flutter/material.dart';

import 'widgets/grid_widget.dart';
import 'widgets/post_widget.dart';
import 'widgets/slideshow_widget.dart';
import 'widgets/story_widget.dart';

class MovieMainPage extends StatefulWidget {
  const MovieMainPage({Key? key}) : super(key: key);

  @override
  State<MovieMainPage> createState() => _MovieMainPageState();
}

class _MovieMainPageState extends State<MovieMainPage> {
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
    return ListView(
      children: [
        SlideShowWidget(),
        StoryWidget(),
        PostWidget(),
        GridWidget(),
      ],
    );
  }
}
