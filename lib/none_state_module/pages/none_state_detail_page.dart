import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NoneStateDetailPage extends StatefulWidget {
  // const NoneStateDetailPage({Key? key}) : super(key: key);

  double size;
  bool dark;

  NoneStateDetailPage(this.size, this.dark);

  @override
  State<NoneStateDetailPage> createState() => _NoneStateDetailPageState();
}

class _NoneStateDetailPageState extends State<NoneStateDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: widget.dark ? Colors.blueGrey[900] : Colors.white,
      appBar: _buildAppBar(),
      body: _buildBody(),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      backgroundColor: widget.dark ? Colors.black : Colors.orange,
      title: Text("None State Detail Page"),
    );
  }

  Widget _buildBody() {
    String text =
        "(CNN)Russian missile strikes have hit the southern Ukrainian port of Odesa, just one day after Ukraine and Russia agreed on a deal that would allow the resumption of vital grain exports from the region.Serhii Bratchuk, a spokesman for the Odessa military administration, said two missiles hit the infrastructure of the port and two were shot down by Ukraine's air defense.At least six explosions were heard in Odesa, according to Ukrainian member of parliament Oleksiy Goncharenko.It comes one day after ministers from both Ukraine and Russia signed an agreement -- brokered by the United Nations and Turkey in Istanbul -- to allow grain exports from Ukrainian Black Sea ports aimed at easing the global food crisis sparked by war.";

    return Stack(
      children: [
        Positioned.fill(
          child: SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.all(10),
              child: Text(
                text,
                style: TextStyle(
                  fontSize: 18 + widget.size,
                  color: widget.dark ? Colors.white70 : Colors.black,
                ),
              ),
            ),
          ),
        ),
        Positioned(
          bottom: 30,
          right: 30,
          child: _buildIcons(),
        ),
      ],
    );
  }

  Widget _buildIcons() {
    return Container(
      color: Colors.black26,
      child: Column(
        children: [
          IconButton(
            onPressed: () {
              setState(() {
                widget.dark = !widget.dark;
              });
            },
            icon: Icon(widget.dark ? Icons.light_mode : Icons.dark_mode, color: Colors.white,),
          ),
          IconButton(
            color: Colors.red,
            onPressed: () {
              setState(() {
                widget.size--;
              });
            },
            icon: Icon(Icons.remove),
          ),
          IconButton(
            color: Colors.blue,
            onPressed: () {
              setState(() {
                widget.size++;
              });
            },
            icon: Icon(Icons.add),
          ),
        ],
      ),
    );
  }
}
