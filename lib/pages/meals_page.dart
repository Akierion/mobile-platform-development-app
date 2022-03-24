import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../builders/recipe_card_builder.dart';

class MealsPage extends StatelessWidget {
  MealsPage({Key? key}) : super(key: key);
  final List<String> recipes = <String> ['Beans on Toast', 'Cheese on Toast', 'Macaroni and Cheese', 'Rainbow Rice', 'Chow Mein', 'Curry'];
  final List<String> calories = <String> ['400', '326', '860', '450', '399', '500'];
  final recipeCardBuilder = RecipeCardBuilder();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView (
        children: <Widget> [
          Center(
            child: Padding(
              padding: const EdgeInsets.only(top:10),
                child: Text('Meals', textAlign: TextAlign.center, style: TextStyle(fontSize: 30, fontFamily: 'Rubik'),
                ),
            ),
          ),
          recipeCardBuilder.recipeCardBuilder(recipes[0], recipes[0]),
          recipeCardBuilder.recipeCardBuilder(recipes[1], recipes[1]),
          recipeCardBuilder.recipeCardBuilder(recipes[2], recipes[2]),
          recipeCardBuilder.recipeCardBuilder(recipes[3], recipes[3]),
        ],
      ),
    );
  }
}

