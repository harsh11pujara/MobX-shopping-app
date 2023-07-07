import 'package:flutter/material.dart';
import 'package:hyperlink_task/screens/home.dart';

void main() {
  runApp(const MyApp());
}
///Command to run Build Runner : flutter packages pub run build_runner watch (To rebuild mobx file)

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

