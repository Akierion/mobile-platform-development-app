
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CreateNewRecipePage extends StatelessWidget {
  const CreateNewRecipePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Center (
              child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget> [
                Text('Recipe Creation', style: TextStyle(fontFamily: 'Rubik', fontSize: 30.0,)),
                Text(''),
                SizedBox(
                  width: 500,
                  child: TextField (decoration: InputDecoration(border: OutlineInputBorder(), labelText: 'Insert recipe name here',), style: TextStyle(fontSize: 15.0, fontFamily: 'Rubik',), maxLines: 1,)),
                Text(''),
                SizedBox(
                  width: 600,
                  child: TextField (decoration: InputDecoration(border: OutlineInputBorder(), labelText: 'Insert recipe steps here',), style: TextStyle(fontSize: 15.0, fontFamily: 'Rubik',), maxLines: 5,)),
                IconButton(
                    icon: Icon(IconData(0xe1f6, fontFamily: 'MaterialIcons')), onPressed: (){}),
            ],
          ),
        )
    );
  }
}
