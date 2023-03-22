import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../constants/language_constant.dart';
import '../logics/language_logic.dart';
import '../logics/size_logic.dart';
import '../logics/theme_logic.dart';
import 'state_detail_page.dart';

class StatePage extends StatefulWidget {
  const StatePage({Key? key}) : super(key: key);

  @override
  State<StatePage> createState() => _StatePageState();
}

class _StatePageState extends State<StatePage> {
  Language _lang = Language();

  @override
  Widget build(BuildContext context) {
    _lang = context.watch<LanguageLogic>().lang;

    return Scaffold(
      // backgroundColor: _dark ? Colors.grey[900] : Colors.white,
      appBar: _buildAppBar(),
      body: _buildBody(),
      drawer: _buildDrawer(),
      floatingActionButton: _buildFloating(),
    );
  }

  Widget _buildFloating() {
    return FloatingActionButton(
      onPressed: () {},
      child: Icon(
        Icons.play_arrow,
      ),
    );
  }

  Widget _buildDrawer() {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(child: Icon(Icons.face, size: 100)),
          ListTile(
            leading: Icon(Icons.home),
            title: Text(_lang.home),
          ),
          ListTile(
            leading: Icon(Icons.color_lens),
            title: Text(_lang.changeToDark),
            onTap: (){
              context.read<ThemeLogic>().toggle();
            },
          ),
          ExpansionTile(
            initiallyExpanded: true,
            title: Text(_lang.language),
            leading: Icon(Icons.language),
            children: [
              ListTile(
                leading: Text("ខ្មែរ"),
                title: Text(_lang.changeToKhmer),
                onTap: () {
                  context.read<LanguageLogic>().changeToKhmer();
                },
              ),
              ListTile(
                leading: Text("EN"),
                title: Text(_lang.changeToEnglish),
                onTap: () {
                  context.read<LanguageLogic>().changeToEnglish();
                },
              ),
              ListTile(
                leading: Text("中文"),
                title: Text("改成中文"),
                onTap: () {
                  context.read<LanguageLogic>().changeToChinese();
                },
              ),
            ],
          ),
        ],
      ),
    );
  }

  AppBar _buildAppBar() {

    bool dark = context.watch<ThemeLogic>().dark;

    return AppBar(
      title: Text(_lang.mainPage),
      actions: [
        IconButton(
          onPressed: () {
            context.read<ThemeLogic>().toggle();
          },
          icon: Icon(dark ? Icons.light_mode : Icons.dark_mode),
        ),
        IconButton(
          onPressed: () {
            context.read<SizeLogic>().decrease();
          },
          icon: Icon(Icons.remove),
        ),
        IconButton(
          onPressed: () {
            context.read<SizeLogic>().increase();
          },
          icon: Icon(Icons.add),
        ),
        IconButton(
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => StateDetailPage(),
              ),
            );
          },
          icon: Icon(CupertinoIcons.arrowshape_turn_up_right_fill),
        ),
      ],
    );
  }

  Widget _buildBody() {
    String text =
        "(CNN)Russian missile strikes have hit the southern Ukrainian port of Odesa, just one day after Ukraine and Russia agreed on a deal that would allow the resumption of vital grain exports from the region.Serhii Bratchuk, a spokesman for the Odessa military administration, said two missiles hit the infrastructure of the port and two were shot down by Ukraine's air defense.At least six explosions were heard in Odesa, according to Ukrainian member of parliament Oleksiy Goncharenko.It comes one day after ministers from both Ukraine and Russia signed an agreement -- brokered by the United Nations and Turkey in Istanbul -- to allow grain exports from Ukrainian Black Sea ports aimed at easing the global food crisis sparked by war.";

    double s = context.watch<SizeLogic>().size;

    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.all(10),
        child: Text(
          text,
          // style: TextStyle(
          //   fontSize: 18 + s,
          //   // color: _dark ? Colors.white70 : Colors.black,
          // ),
        ),
      ),
    );
  }
}
