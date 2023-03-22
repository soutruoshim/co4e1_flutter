import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../logics/randomuser_logic.dart';
import 'randomuser_splash_page.dart';


class RandomUserApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => RandomUserLogic()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: RandomUserSplashPage(),
      ),
    );
  }
}
