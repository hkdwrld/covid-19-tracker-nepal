import 'package:flutter/material.dart';
import 'HomePage.dart';
import 'StateView.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Demo",
      initialRoute: '/',
      routes: {
        '/':(context)=>HomePage(),
        '/state':(context)=>StateView(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}
