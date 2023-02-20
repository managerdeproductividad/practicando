import 'package:flutter/material.dart';
import 'package:practicando/pages/home_page.dart';
import 'package:practicando/pages/login2.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}
