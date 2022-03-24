import 'package:flutter/material.dart';
import '../builders/recipe_card_builder.dart';

class DessertsPage extends StatelessWidget {
  DessertsPage({Key? key}) : super(key: key);
  final List<String> recipes = <String> ['Bread & Butter Pudding', 'Cupcakes', 'Rice Krispie Cakes', 'Pancakes with Maple Syrup', 'Jumbo Chocolate-Chip Cookies', 'Mug Cake', 'Bananna Bread', '"Special" Brownies', 'Simple Apple Crumble'];
  final List<String> calories = <String> ['566', '350', '278', '350', '299', '1117', '218', '196', '608'];
  final recipeCardBuilder = RecipeCardBuilder();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView (
        children: <Widget> [
          Center(
            child: Padding(
              padding: const EdgeInsets.only(top:10),
              child: Text('Desserts', textAlign: TextAlign.center, style: TextStyle(fontSize: 30, fontFamily: 'Rubik'),
              ),
            ),
          ),
          recipeCardBuilder.recipeCardBuilder(recipes[0], calories[0]),
          recipeCardBuilder.recipeCardBuilder(recipes[1], calories[1]),
          recipeCardBuilder.recipeCardBuilder(recipes[2], calories[2]),
          recipeCardBuilder.recipeCardBuilder(recipes[3], calories[3]),
          recipeCardBuilder.recipeCardBuilder(recipes[4], calories[4]),
          recipeCardBuilder.recipeCardBuilder(recipes[5], calories[5]),
          recipeCardBuilder.recipeCardBuilder(recipes[6], calories[6]),
          recipeCardBuilder.recipeCardBuilder(recipes[7], calories[7]),
          recipeCardBuilder.recipeCardBuilder(recipes[8], calories[8]),
        ],
),
    );
  }
}
