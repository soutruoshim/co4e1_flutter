import 'package:flutter/material.dart';

import '../../constants/movie_list_constant.dart';
import '../../models/movie_model.dart';
import '../../pages/detail_page.dart';

class StoryWidget extends StatefulWidget {
  const StoryWidget({Key? key}) : super(key: key);

  @override
  State<StoryWidget> createState() => _StoryWidgetState();
}

class _StoryWidgetState extends State<StoryWidget> {

  final double _slideShowHeight = 300;
  final double _slideWidth = 150;
  final double _corner = 20;

  @override
  Widget build(BuildContext context) {
    return _buildStory();
  }

  Widget _buildStory() {
    return SizedBox(
      height: _slideShowHeight,
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
        width: _slideWidth,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(_corner),
            image: DecorationImage(
              image: NetworkImage(item.image),
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}
