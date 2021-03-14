import 'package:flutter/material.dart';
import 'vtubers_list.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'HoloSched',
      theme: ThemeData(
        primarySwatch: Colors.lightBlue,
      ),
      home: VtuberList(),
    );
  }
}

