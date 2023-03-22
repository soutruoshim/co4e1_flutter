import 'package:c4e1/state_module/pages/state_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../logics/theme_logic.dart';

class ThemePage extends StatelessWidget {
  const ThemePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    bool _dark = context.watch<ThemeLogic>().dark;

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: StatePage(),
      themeMode: _dark ? ThemeMode.dark : ThemeMode.light, //light or dark or system
      theme: ThemeData(
        brightness: Brightness.light,
        textTheme: TextTheme(
          bodyText1: TextStyle(fontSize: 20), //in Drawer
          bodyText2: TextStyle(fontSize: 20), //in Body
        ),
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.pink,
        ),
        floatingActionButtonTheme: FloatingActionButtonThemeData(
          backgroundColor: Colors.orange,
        ),
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        textTheme: TextTheme(
          bodyText1: TextStyle(fontSize: 20), //in Drawer
          bodyText2: TextStyle(fontSize: 20), //in Body
        ),
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.blueGrey,
        ),
      ),
    );
  }
}
