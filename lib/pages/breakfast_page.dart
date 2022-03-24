import 'package:flutter/material.dart';
import '../builders/recipe_card_builder.dart';

class BreakfastPage extends StatelessWidget {
  BreakfastPage({Key? key}) : super(key: key);
  final List<String> recipes = <String> ['Avocado on Toast', 'American Pancakes', 'Eggy Soldiers', 'Porridge', 'Omelette'];
  final List<String> calories = <String> ['280', '356', '300', '175', '200'];
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
        recipeCardBuilder.recipeCardBuilder(recipes[0], calories[0]),
        recipeCardBuilder.recipeCardBuilder(recipes[1], calories[1]),
        recipeCardBuilder.recipeCardBuilder(recipes[2], calories[2]),
        recipeCardBuilder.recipeCardBuilder(recipes[3], calories[3]),
      ],
    ),
      );
}
}
