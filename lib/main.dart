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
      home: MainPage(),
      theme: lightTheme,
      //new ThemeData(scaffoldBackgroundColor: Colors.grey[300]),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Icon searchIcon = const Icon(IconData(0xe567, fontFamily: 'MaterialIcons'));
  Icon settingsIcon = const Icon(IconData(0xe57f, fontFamily: 'MaterialIcons'));
  Icon loginIcon = const Icon(Icons.account_circle_rounded);


  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}

