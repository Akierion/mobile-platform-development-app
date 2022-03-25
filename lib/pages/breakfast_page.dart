import 'package:first_prototype/pages/create_new_recipe_page.dart';
import 'package:flutter/material.dart';
import '../builders/recipe_card_builder.dart';

class BreakfastPage extends StatelessWidget {
  BreakfastPage({Key? key}) : super(key: key);
  // ------------------------------------------------------------
  final List<String> recipes = <String> ['Avocado on Toast', 'American Pancakes', 'Eggy Soldiers', 'Porridge', 'Omelette'];
  final List<String> calories = <String> ['280', '356', '300', '175', '200'];
  final List<String> recipeInstructions = <String> ['Recipe Instructions'];
  // Currently only the recipe name and instructions are taken from the user and put in the firebase database,
  // this can be changed to add a lot more info, e.g. nutritional information, allergens, etc
  // ------------------------------------------------------------
  // Create an object of the RecipeCardBuilder() class so the recipeCardBuilder function can be called
  final recipeCardBuilder = RecipeCardBuilder();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Breakfast Recipes',textAlign: TextAlign.center, style: TextStyle(fontSize: 30, fontFamily: 'Rubik')),centerTitle: true,
        backgroundColor: Colors.white,foregroundColor: Colors.black),
        body: Container(
          child: ListView (
            children: <Widget> [
              // Build a recipe 'Card' as per the recipe_card_builder.dart class, for each of the recipes in the recipes list
            recipeCardBuilder.recipeCardBuilder(recipes[0], calories[0],  recipeInstructions[0]),
            recipeCardBuilder.recipeCardBuilder(recipes[1], calories[1],  recipeInstructions[0]),
            recipeCardBuilder.recipeCardBuilder(recipes[2], calories[2],  recipeInstructions[0]),
            recipeCardBuilder.recipeCardBuilder(recipes[3], calories[3],  recipeInstructions[0]),
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
