import 'package:flutter/material.dart';
import 'package:flutter_app/screens/home_screen.dart';
import 'dart:core';

void main() => runApp(MyApp());



class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "TADS - News",
      theme: ThemeData(
        primaryColor: Colors.white
      ),
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}
