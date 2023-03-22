import 'package:flutter/material.dart';

import 'my_gridview_page.dart';
import 'my_listview_page.dart';
import 'my_pageview_page.dart';
import 'my_row_column_page.dart';

class MainPageViewPage extends StatefulWidget {
  const MainPageViewPage({Key? key}) : super(key: key);

  @override
  State<MainPageViewPage> createState() => _MainPageViewPageState();
}

class _MainPageViewPageState extends State<MainPageViewPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: _buildBody(),
      bottomNavigationBar: _buildBottom(),
    );
  }

  PageController _pageController = PageController();

  Widget _buildBody() {
    return PageView(
      controller: _pageController,
      onPageChanged: (index){
        setState(() {
          _currentIndex = index;
        });
      },
      children: [
        MyPageViewPage(),
        MyListViewPage(),
        MyRowColumnPage(),
        MyGridViewPage(),
      ],
    );
  }

  int _currentIndex = 0;

  Widget _buildBottom() {
    return BottomNavigationBar(
      currentIndex: _currentIndex,
      onTap: (index){
        setState(() {
          _currentIndex = index;
        });
        _pageController.jumpToPage(_currentIndex);
      },
      type: BottomNavigationBarType.fixed,
      selectedItemColor: Colors.pink,
      unselectedItemColor: Colors.grey,
      // showSelectedLabels: false,
      showUnselectedLabels: false,
      items: [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
        BottomNavigationBarItem(icon: Icon(Icons.play_arrow), label: "Play"),
        BottomNavigationBarItem(icon: Icon(Icons.account_circle), label: "Account"),
        BottomNavigationBarItem(icon: Icon(Icons.menu), label: "Menu"),
      ],
    );
  }
}
