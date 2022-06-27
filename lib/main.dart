import 'package:flutter/material.dart';
import 'package:snap/style/style.dart';
import 'package:snap/view/screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SNAP',
      theme: ThemeData(
        brightness: Brightness.light, fontFamily: BoldFont,
      ),
      home: HomeScreen(),
    );
  }
}