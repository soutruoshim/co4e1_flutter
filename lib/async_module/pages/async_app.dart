import 'package:c4e1/async_module/logics/post_logic.dart';
import 'package:c4e1/async_module/pages/async_splash_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class AsyncPage extends StatelessWidget {
  const AsyncPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => PostLogic()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: AsyncSplashPage(),
      ),
    );
  }
}
