import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

//stful

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  bool _dark = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _dark == true ? Colors.blueGrey[900] : Colors.white,
      appBar: _buildAppBar(),
      body: _buildBody(),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      title: Text("Home Page"),
      backgroundColor: _dark ? Colors.black : Colors.deepOrange,
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
              _counter--;
            });
          },
          icon: Icon(Icons.remove),
        ),
        IconButton(
          onPressed: () {
            setState(() {
              _counter++;
            });
          },
          icon: Icon(Icons.add),
        ),
      ],
    );
  }

  Widget _buildBody() {
    return Container(
      alignment: Alignment.topCenter,
      padding: EdgeInsets.all(10),
      child: _buildText(),
    );
  }

  int _counter = 0;

  _buildText() {
    return Text(
      "Cambodia is a Southeast Asian nation whose landscape spans low-lying plains, the Mekong Delta, mountains and Gulf of Thailand coastline. Phnom Penh, its capital, is home to the art deco Central Market, glittering Royal Palace and the National Museum's historical and archaeological exhibits. In the country's northwest are the ruins of Angkor Wat, a massive stone temple complex built during the Khmer Empire.",
      style: TextStyle(
        color: _dark ? Colors.white70 : Colors.black,
        fontSize: 20 + _counter.toDouble(),
      ),
    );
  }

  Widget _buildNumberTextField() {
    return Container(
      margin: EdgeInsets.all(20),
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        color: Colors.orange.withOpacity(0.5),
      ),
      child: TextField(
        keyboardType: TextInputType.number,
        autocorrect: false,
        style: TextStyle(color: Colors.white),
        decoration: InputDecoration(
          hintText: "Enter number",
          hintStyle: TextStyle(color: Colors.white60),
          icon: Icon(Icons.numbers, color: Colors.white60),
          border: InputBorder.none,
        ),
      ),
    );
  }

  Widget _buildPasswordTextField() {
    return Container(
      margin: EdgeInsets.all(20),
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        color: Colors.pink.withOpacity(0.5),
      ),
      child: TextField(
        keyboardType: TextInputType.text,
        autocorrect: false,
        style: TextStyle(color: Colors.white),
        obscureText: true,
        //password
        decoration: InputDecoration(
          hintText: "Enter password",
          hintStyle: TextStyle(color: Colors.white60),
          icon: Icon(Icons.vpn_key_sharp, color: Colors.white60),
          suffixIcon: IconButton(
            onPressed: () {},
            icon: Icon(Icons.visibility_sharp),
          ),
          border: InputBorder.none,
        ),
      ),
    );
  }

  Widget _buildEmailTextField() {
    return Container(
      margin: EdgeInsets.all(20),
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        color: Colors.purple.withOpacity(0.5),
      ),
      child: TextField(
        keyboardType: TextInputType.emailAddress,
        autocorrect: false,
        style: TextStyle(color: Colors.white),
        decoration: InputDecoration(
          hintText: "Enter email",
          hintStyle: TextStyle(color: Colors.white60),
          icon: Icon(Icons.email, color: Colors.white60),
          border: InputBorder.none,
        ),
      ),
    );
  }
}
