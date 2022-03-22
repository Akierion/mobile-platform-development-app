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
            Text(''),
            Text(''),
            Text('Welcome to Recipes Necessities', style: TextStyle(fontFamily: 'Rubik', fontSize: 30.0),),
            Text(''),
            Text(''),
            const Image(image: AssetImage('logo.png'), height: 350,),
            Text(''),
            Text(''),
            Text('The one stop that helps students shop.', style: TextStyle(fontFamily: 'Rubik', fontSize: 30.0),),
          ]
        ),
    ),
    );
  }
}
