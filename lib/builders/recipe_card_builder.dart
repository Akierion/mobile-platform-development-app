import 'package:flutter/material.dart';

class RecipeCardBuilder extends StatefulWidget {
  const RecipeCardBuilder({Key? key}) : super(key: key);

  @override
  State<RecipeCardBuilder> createState() => _RecipeCardBuilderState();
  Card recipeCardBuilder (String recipeName, String calories,  String recipeInstructions) {
    return Card (
      child: Column (
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: <Widget> [
          ListTile (
            title: Text(recipeName),
            subtitle: Text(calories + ' calories per serving'),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              // ------------------------------------------------------------
              // Can add additional buttons to show allergy & nutritional info etc..
              // ElevatedButton(
              //     child: const Text('Allergens'),
              //     onPressed: (){}),
              // ElevatedButton(
              //   child: const Text('Check Nutrtional Content'),
              //   onPressed: (){},
              // ),
              // ------------------------------------------------------------
              ElevatedButton(
                onPressed: () {  },
                child: const Text('See Recipe Instructions')
              )],
                ),
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