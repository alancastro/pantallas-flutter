import 'package:flutter/material.dart';
import 'package:fast_food/screens/welcome.dart';
import 'package:fast_food/screens/splash.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Fast Food App',
      home: Scaffold(
        body: PageView(children: [
          Welcome(),
          Splash(),
        ],),
      )
    );
  }
}