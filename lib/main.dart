import 'package:bloc_flutter/main_screen/MainPage.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          brightness: Brightness.light,
          primaryColor: Colors.deepPurpleAccent,
          accentColor: Colors.deepPurple,
          canvasColor: Colors.white70),
      home: MainPage(),
    );
  }
}
