import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold (
      appBar: AppBar(title: Text('Homepage',textAlign: TextAlign.center, style: TextStyle(fontSize: 30, fontFamily: 'Rubik')),centerTitle: true,
      backgroundColor: Colors.white, foregroundColor: Colors.black),
      body: Container(
      height: 600,
      width: double.infinity, // Go full page width
      child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[ // Can specify as many widgets as necessary in here, it will just show it in a single column within the child container (taking as much space up as the children require)
            Text('Welcome to Recipes Necessities', style: TextStyle(fontFamily: 'Rubik', fontSize: 25.0),textAlign: TextAlign.center,),
            SizedBox(height: 10.0), // Using SizedBox here adds a specified height or width of space between the previous and the next widget
            const Image(image: AssetImage('assets/logo.png'), height: 350,),
            SizedBox(height: 10.0),
            Text('The one stop that helps students shop.', style: TextStyle(fontFamily: 'Rubik', fontSize: 25.0),textAlign: TextAlign.center,),
            SizedBox(height: 30.0),
            Text('Tip of the day: Buying frozen food is sometimes cheaper, and longer-lasting!', style: TextStyle(fontFamily: 'Rubik', fontSize: 15.0), textAlign: TextAlign.center),
          ]
        ),
    ),
      ),
    );
  }
}
