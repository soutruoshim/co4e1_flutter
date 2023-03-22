import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class SampleAsyncPage extends StatefulWidget {
  const SampleAsyncPage({Key? key}) : super(key: key);

  @override
  State<SampleAsyncPage> createState() => _SampleAsyncPageState();
}

class _SampleAsyncPageState extends State<SampleAsyncPage> {
  void hello(String name) {
    print("Hello $name");
  }

  Future<void> hi(String name) async {
    print("Hi $name");
  }

  int add(int a, int b) {
    return a + b;
  }

  Future<int> sum(int a, int b) {
    return Future.value(a + b);
  }

  _myBuild() async {
    int a = add(10, 20);
    print('a = $a');
    int s = await sum(20, 30);
    print("s = $s");
    hello("Sok");
    hi("Sao");
  }

  @override
  Widget build(BuildContext context) {
    _myBuild();

    return Scaffold(
      appBar: _buildAppBar(),
      body: _buildBody(),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      title: Text("Sample Async Page"),
      actions: [
        IconButton(
          onPressed: () {
            _showSnackBar(context, "Hello");
          },
          icon: Icon(Icons.visibility),
        ),
      ],
    );
  }

  _showSnackBar(BuildContext context, String text) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(text),
        action: SnackBarAction(
          onPressed: (){
            ScaffoldMessenger.of(context).hideCurrentSnackBar();
          },
          label: "DONE",
        ),
      ),
    );
  }

  Future<String> _getFakeData() {
    return Future.delayed(Duration(seconds: 5), () {
      return "Some Data";
    });
  }

  Widget _buildBody() {
    return Container(
      alignment: Alignment.center,
      child: FutureBuilder<int>(
        future: _getNumber(5000000000),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return Text(
              "${snapshot.data}",
              style: TextStyle(fontSize: 20),
            );
          } else {
            return CircularProgressIndicator();
          }
        },
      ),
    );
  }

  Future<int> _getNumber(int max) {
    return compute(_calculate, max);
  }
}

int _calculate(int max){
  int total = 0;
  for (int index = 0; index <= max; index++) {
    total += index;
  }
  return total;
}
