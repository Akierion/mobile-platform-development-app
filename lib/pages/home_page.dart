import 'package:flutter/cupertino.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 600,
      width: double.infinity,
      child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Welcome to Recipes Necessities', style: TextStyle(fontFamily: 'Rubik', fontSize: 25.0),textAlign: TextAlign.center,),
            SizedBox(height: 10.0),
            const Image(image: AssetImage('assets/logo.png'), height: 350,),
            SizedBox(height: 10.0),
            Text('The one stop that helps students shop.', style: TextStyle(fontFamily: 'Rubik', fontSize: 25.0),textAlign: TextAlign.center,),
            SizedBox(height: 30.0),
            Text('Tip of the day: Buying frozen food is cheaper, and longerlasting!', style: TextStyle(fontFamily: 'Rubik', fontSize: 15.0), textAlign: TextAlign.center),
          ]
        ),
    ),
    );
  }
}
