import 'package:flutter/material.dart';
import '../builders/recipe_card_builder.dart';
import 'create_new_recipe_page.dart';

class DessertsPage extends StatelessWidget {
  DessertsPage({Key? key}) : super(key: key);
  // ------------------------------------------------------------
  final List<String> recipes = <String> ['Bread & Butter Pudding', 'Cupcakes', 'Rice Krispie Cakes', 'Pancakes with Maple Syrup', 'Jumbo Chocolate-Chip Cookies', 'Mug Cake', 'Bananna Bread', '"Special" Brownies', 'Simple Apple Crumble'];
  final List<String> calories = <String> ['566', '350', '278', '350', '299', '1117', '218', '196', '608'];
  final List<String> recipeInstructions = <String> ['Recipe Instructions'];
  // ------------------------------------------------------------
  // Create an object of the RecipeCardBuilder() class so the recipeCardBuilder function can be called
  final recipeCardBuilder = RecipeCardBuilder();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Dessert Recipes',textAlign: TextAlign.center, style: TextStyle(fontSize: 30, fontFamily: 'Rubik')),centerTitle: true,
            backgroundColor: Colors.white,foregroundColor: Colors.black),
        body: Container(
          child: ListView (
              children: <Widget> [
                // Build a recipe 'Card' as per the recipe_card_builder.dart class, for each of the recipes in the recipes list
                recipeCardBuilder.recipeCardBuilder(recipes[0], calories[0], recipeInstructions[0]),
                recipeCardBuilder.recipeCardBuilder(recipes[1], calories[1], recipeInstructions[0]),
                recipeCardBuilder.recipeCardBuilder(recipes[2], calories[2], recipeInstructions[0]),
                recipeCardBuilder.recipeCardBuilder(recipes[3], calories[3], recipeInstructions[0]),
              ]
          ),
        ),
        // This button is used to add recipes to Firebase, if the icon is pressed, push a new page (AddRecipe)
        floatingActionButton: FloatingActionButton(backgroundColor: Colors.white, foregroundColor: Colors.black.withOpacity(0.7),
            child: Icon(Icons.add),onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => AddRecipe()));}
        ));
  }
}
