import 'package:flutter/material.dart';

class RecipeCardBuilder extends StatefulWidget {
  const RecipeCardBuilder({Key? key}) : super(key: key);

  @override
  State<RecipeCardBuilder> createState() => _RecipeCardBuilderState();
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
                child: const Text('See Recipe'),
                onPressed: (){},
              )
            ],
          )
        ],
      ),
    );
  }
}


class _RecipeCardBuilderState extends State<RecipeCardBuilder> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }

// Creates a recipe for each recipe in the database
}