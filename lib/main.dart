import 'package:beer_app/views/home.view.dart';
import 'package:beer_app/views/style.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: theme(),
      home: HomeView(),
    );
  }
}
