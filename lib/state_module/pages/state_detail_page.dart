import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../constants/language_constant.dart';
import '../logics/language_logic.dart';
import '../logics/size_logic.dart';
import '../logics/theme_logic.dart';

class StateDetailPage extends StatefulWidget {
  @override
  State<StateDetailPage> createState() => _StateDetailPageState();
}

class _StateDetailPageState extends State<StateDetailPage> {
  bool _dark = false;
  Language _lang = Language();

  @override
  Widget build(BuildContext context) {
    _dark = context.watch<ThemeLogic>().dark;
    _lang = context.watch<LanguageLogic>().lang;

    return Scaffold(
      backgroundColor: _dark ? Colors.blueGrey[900] : Colors.white,
      appBar: _buildAppBar(),
      body: _buildBody(),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      backgroundColor: _dark ? Colors.black : Colors.purple,
      title: Text(_lang.detailPage),
    );
  }

  Widget _buildBody() {
    String text =
        "(CNN)Russian missile strikes have hit the southern Ukrainian port of Odesa, just one day after Ukraine and Russia agreed on a deal that would allow the resumption of vital grain exports from the region.Serhii Bratchuk, a spokesman for the Odessa military administration, said two missiles hit the infrastructure of the port and two were shot down by Ukraine's air defense.At least six explosions were heard in Odesa, according to Ukrainian member of parliament Oleksiy Goncharenko.It comes one day after ministers from both Ukraine and Russia signed an agreement -- brokered by the United Nations and Turkey in Istanbul -- to allow grain exports from Ukrainian Black Sea ports aimed at easing the global food crisis sparked by war.";

    double s = context.watch<SizeLogic>().size;

    return Stack(
      children: [
        Positioned.fill(
          child: SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.all(10),
              child: Text(
                text,
                // style: TextStyle(
                //   fontSize: 18 + s,
                //   color: _dark ? Colors.white70 : Colors.black,
                // ),
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
      color: Colors.black38,
      child: Column(
        children: [
          IconButton(
            onPressed: () {
              context.read<ThemeLogic>().toggle();
            },
            icon: Icon(
              _dark ? Icons.light_mode : Icons.dark_mode,
              color: Colors.white,
            ),
          ),
          IconButton(
            color: Colors.white,
            onPressed: () {
              context.read<SizeLogic>().decrease();
            },
            icon: Icon(Icons.remove),
          ),
          IconButton(
            color: Colors.white,
            onPressed: () {
              context.read<SizeLogic>().increase();
            },
            icon: Icon(Icons.add),
          ),
        ],
      ),
    );
  }
}
