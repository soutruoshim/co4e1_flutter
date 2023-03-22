import 'package:flutter/material.dart';

class MyStackPage extends StatefulWidget {
  const MyStackPage({Key? key}) : super(key: key);

  @override
  State<MyStackPage> createState() => _MyStackPageState();
}

class _MyStackPageState extends State<MyStackPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("My Stack Page"),
      ),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(color: Colors.pink, width: 370, height: 300),
        Container(color: Colors.purple, width: 250, height: 200),
        Container(color: Colors.orange, width: 150, height: 150),
        Positioned(
          // top: 20,
          bottom: 20,
          // left: 50,
          right: 20,
          child: Container(color: Colors.blue, width: 50, height: 50),
        ),
      ],
    );
  }
}
