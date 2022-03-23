import 'package:first_prototype/pages/main_page.dart';
import 'package:flutter/material.dart';
import 'package:first_prototype/pages/themes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'RECIPES NECESSITIES', // Title of App
      debugShowCheckedModeBanner: false,
      home: MainPage(),
      theme: lightTheme,
      //new ThemeData(scaffoldBackgroundColor: Colors.grey[300]),
    );
  }
}