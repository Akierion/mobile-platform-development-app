import 'package:flutter/material.dart';
import '../builders/recipe_card_builder.dart';

class BreakfastPage extends StatelessWidget {
  BreakfastPage({Key? key}) : super(key: key);
  final List<String> recipes = <String> ['Recipe 1', 'Recipe 2', 'Recipe 3', 'Recipe 4'];
  final List<String> calories = <String> ['400', '300', '600', '800'];
  final recipeCardBuilder = RecipeCardBuilder();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView (
      children: <Widget> [
        Center(
          child: Padding(
              padding: const EdgeInsets.only(top:10),
              child: Text('Breakfast', textAlign: TextAlign.center, style: TextStyle(fontSize: 30, fontFamily: 'Rubik'),
              ),
          ),
        ),
        recipeCardBuilder.recipeCardBuilder('recipe 1', '500'),
        recipeCardBuilder.recipeCardBuilder('recipe 2', '600'),
        recipeCardBuilder.recipeCardBuilder('recipe 3', '500')
    ],
    ),
      );
}
}
