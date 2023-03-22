import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../logics/randomuser_logic.dart';
import 'randomuser_page.dart';

class RandomUserSplashPage extends StatefulWidget {
  const RandomUserSplashPage({Key? key}) : super(key: key);

  @override
  State<RandomUserSplashPage> createState() => _RandomUserSplashPageState();
}

class _RandomUserSplashPageState extends State<RandomUserSplashPage> {
  _init() async {
    await context.read<RandomUserLogic>().read();

    Future.delayed(Duration(seconds: 1), () {
      if (mounted) {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) => RandomUserPage(),
          ),
        );
      }
    });
  }

  @override
  void initState() {
    super.initState();
    _init();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Icon(Icons.supervised_user_circle, size: 100),
      ),
    );
  }
}
