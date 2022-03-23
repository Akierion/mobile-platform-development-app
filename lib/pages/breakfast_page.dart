import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BreakfastPage extends StatelessWidget {
  const BreakfastPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView (
      children: <Widget> [
        Text(''),
        Text('Breakfast Recipes', textAlign: TextAlign.center, style: TextStyle(fontSize: 35, fontFamily: 'Rubik'),),
        Text(''),
        recipeCardBuilder('recipe 1', '500'),
        recipeCardBuilder('recipe 2', '600')
    ],
    ),
      );
  }

   Card recipeCardBuilder (String recipeName, String calories) {
      return Card (
        child: Column (
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: <Widget> [
               ListTile (
                title: Text(recipeName),
                subtitle: Text(calories + ' calories'),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  TextButton(
                      child: const Text('Check Nutrtional Content'),
                      onPressed: (){},
                  ),
                  TextButton(
                     child: const Text('Check Nutrtional Content'),
                     onPressed: (){},
                  )
              ],
            )
        ],
      ),
     );
}
}
