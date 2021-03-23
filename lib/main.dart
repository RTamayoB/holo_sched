import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'vtubers_list.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
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
      home: ListScreen(),
    );
  }
}

