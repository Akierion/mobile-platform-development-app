import 'package:flutter/material.dart';

class RecipeCardBuilder extends StatefulWidget {
  const RecipeCardBuilder({Key? key}) : super(key: key);

  @override
  State<RecipeCardBuilder> createState() => _RecipeCardBuilderState();
  Card recipeCardBuilder (String recipeName, String calories,  String recipeInstructions) {
    // Can be used to create a recipe for each recipe stored in Firebase
    // Saves lines of code hardcoding a card for each recipe (can also be expanded each time a new recipe was added if a loop was went through a list containing recipe names - taken from firebase and creating a card based on the length of it)
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
              // Can add additional buttons to show allergy & nutritional info e.g.,
              // ElevatedButton(
              //     child: const Text('Allergens'),
              //     onPressed: (){}),
              // ElevatedButton(
              //   child: const Text('Check Nutrtional Content'),
              //   onPressed: (){},
              // ),
              // ------------------------------------------------------------
              ElevatedButton(
                onPressed: () { /* Once pressed, a new page should come up showing the recipe instructions (if implemented) */ },
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
    return Container(); // Empty because it's not needed
  }
}


