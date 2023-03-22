import 'package:flutter/material.dart';

import '../models/movie_model.dart';

class DetailPage extends StatefulWidget {
  // const DetailPage({Key? key}) : super(key: key);

  final MovieModel item;

  DetailPage(this.item);

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text("Movie Details"),
        backgroundColor: Colors.blueGrey[900],
      ),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return Container(
      alignment: Alignment.center,
      child: ListView(
        children: [
          Container(
            child: Image.network(widget.item.image, fit: BoxFit.cover),
          ),
          Container(
            alignment: Alignment.center,
            padding: EdgeInsets.all(10),
            child: Text(
              widget.item.title,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
          Container(
            alignment: Alignment.center,
            padding: EdgeInsets.all(10),
            child: Text(
              widget.item.des,
              style: TextStyle(fontSize: 18, color: Colors.white70),
            ),
          ),
        ],
      ),
    );
  }
}
