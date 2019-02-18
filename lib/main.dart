import 'package:flutter/material.dart';
import 'comics_list.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.white,
        primaryColorDark: Colors.black87,
        secondaryHeaderColor: Colors.black,
        accentColor: Colors.black45,
        backgroundColor: Colors.white24,
        buttonColor: Colors.grey,
        fontFamily: "Roboto",

        textTheme: TextTheme(
          title: TextStyle(
            fontSize: 20.0,
            fontFamily: 'roboto',
            fontWeight: FontWeight.bold,
            color: Colors.black87
          ),
        ),
      ),
      title: 'Spider-Man Comics',
      home: new ComicsList(),
    );
  }
}