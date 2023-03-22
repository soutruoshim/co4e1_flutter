import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'none_state_detail_page.dart';

class NoneStatePage extends StatefulWidget {
  const NoneStatePage({Key? key}) : super(key: key);

  @override
  State<NoneStatePage> createState() => _NoneStatePageState();
}

class _NoneStatePageState extends State<NoneStatePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _dark ? Colors.grey[900] : Colors.white,
      appBar: _buildAppBar(),
      body: _buildBody(),
    );
  }

  bool _dark = false;

  AppBar _buildAppBar() {
    return AppBar(
      backgroundColor: _dark ? Colors.black : Colors.blue,
      title: Text("None State Page"),
      actions: [
        IconButton(
          onPressed: () {
            setState(() {
              _dark = !_dark;
            });
          },
          icon: Icon(_dark ? Icons.light_mode : Icons.dark_mode),
        ),
        IconButton(
          onPressed: () {
            setState(() {
              _size--;
            });
          },
          icon: Icon(Icons.remove),
        ),
        IconButton(
          onPressed: () {
            setState(() {
              _size++;
            });
          },
          icon: Icon(Icons.add),
        ),
        IconButton(
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => NoneStateDetailPage(_size, _dark),
              ),
            );
          },
          icon: Icon(CupertinoIcons.arrowshape_turn_up_right_fill),
        ),
      ],
    );
  }

  double _size = 0;

  Widget _buildBody() {
    String text =
        "(CNN)Russian missile strikes have hit the southern Ukrainian port of Odesa, just one day after Ukraine and Russia agreed on a deal that would allow the resumption of vital grain exports from the region.Serhii Bratchuk, a spokesman for the Odessa military administration, said two missiles hit the infrastructure of the port and two were shot down by Ukraine's air defense.At least six explosions were heard in Odesa, according to Ukrainian member of parliament Oleksiy Goncharenko.It comes one day after ministers from both Ukraine and Russia signed an agreement -- brokered by the United Nations and Turkey in Istanbul -- to allow grain exports from Ukrainian Black Sea ports aimed at easing the global food crisis sparked by war.";

    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.all(10),
        child: Text(
          text,
          style: TextStyle(
            fontSize: 18 + _size,
            color: _dark ? Colors.white70 : Colors.black,
          ),
        ),
      ),
    );
  }
}
