import 'dart:async';
import 'package:flutter/material.dart';
import '../../constants/movie_list_constant.dart';
import '../../models/movie_model.dart';
import '../../pages/detail_page.dart';

class SlideShowWidget extends StatefulWidget {
  const SlideShowWidget({Key? key}) : super(key: key);

  @override
  State<SlideShowWidget> createState() => _SlideShowWidgetState();
}

class _SlideShowWidgetState extends State<SlideShowWidget> {
  final double _height = 300;
  final _delayInSecond = 3;

  int _page = 0;

  @override
  void initState() {
    super.initState();

    Timer.periodic(Duration(seconds: _delayInSecond), (timer) {
      _page++;
      if(_page >= movieList.length) _page = 1;
      _pageController.animateToPage(
        _page,
        duration: Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return _buildSlideShow();
  }

  PageController _pageController = PageController();

  Widget _buildSlideShow() {
    return SizedBox(
      height: _height,
      child: PageView.builder(
          controller: _pageController,
          physics: BouncingScrollPhysics(),
          itemCount: movieList.length,
          itemBuilder: (context, index) {
            return _buildPageItem(movieList[index]);
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
}
