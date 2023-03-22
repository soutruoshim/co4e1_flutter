import 'package:c4e1/async_module/logics/post_logic.dart';
import 'package:c4e1/async_module/pages/api_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AsyncSplashPage extends StatefulWidget {
  const AsyncSplashPage({Key? key}) : super(key: key);

  @override
  State<AsyncSplashPage> createState() => _AsyncSplashPageState();
}

class _AsyncSplashPageState extends State<AsyncSplashPage> {
  _init() async {
    await context.read<PostLogic>().read();

    Future.delayed(Duration(seconds: 1), () {
      if (mounted) {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) => ApiPage(),
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
        child: Icon(Icons.local_post_office, size: 100),
      ),
    );
  }
}
