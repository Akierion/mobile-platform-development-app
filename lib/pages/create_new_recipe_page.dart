
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
                  width: 200,
                  child: TextField (decoration: InputDecoration(border: OutlineInputBorder(), labelText: 'Insert recipe name here',), style: TextStyle(fontSize: 15.0, fontFamily: 'Rubik',), maxLines: 1,)),
                SizedBox(
                  width: 300,
                  child: TextField (decoration: InputDecoration(border: OutlineInputBorder(), labelText: 'Insert recipe steps here',), style: TextStyle(fontSize: 15.0, fontFamily: 'Rubik',), maxLines: 5,)),
                SizedBox(
                child: OutlinedButton (
                  style: OutlinedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(horizontal: 40),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      )
                  ),
                  onPressed: (){},
                  child: Text('UPLOAD', style: TextStyle(
                      fontSize: 16, letterSpacing: 2.2, color: Colors.black)
                  ),
                ),
                )],
          ),
        )
    );
  }
}
