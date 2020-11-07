import 'package:flutter/material.dart';
import 'package:fast_food/screens/welcome.dart';
import 'package:fast_food/screens/splash.dart';
import 'package:provider/provider.dart';
import 'Providers/UsrPrv.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => UsrPrv()),
      ],
      child: App(),
    ),
  );
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Fast Food App',
        home: Scaffold(
          body: PageView(
            children: [
              Splash(),
              Welcome(),
            ],
          ),
        ));
  }
}
