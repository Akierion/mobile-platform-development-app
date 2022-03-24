import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../builders/recipe_card_builder.dart';
import 'create_new_recipe_page.dart';

class MealsPage extends StatelessWidget {
  MealsPage({Key? key}) : super(key: key);
  final List<String> recipes = <String> ['Beans on Toast', 'Cheese on Toast', 'Macaroni and Cheese', 'Rainbow Rice', 'Chow Mein', 'Curry'];
  final List<String> calories = <String> ['400', '326', '860', '450', '399', '500'];
  final recipeCardBuilder = RecipeCardBuilder();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Lunch Recipes',textAlign: TextAlign.center, style: TextStyle(fontSize: 30, fontFamily: 'Rubik')),centerTitle: true,
            backgroundColor: Colors.white,foregroundColor: Colors.black),
        body: Container(
          child: ListView (
              children: <Widget> [
                recipeCardBuilder.recipeCardBuilder(recipes[0], calories[0]),
                recipeCardBuilder.recipeCardBuilder(recipes[1], calories[1]),
                recipeCardBuilder.recipeCardBuilder(recipes[2], calories[2]),
                recipeCardBuilder.recipeCardBuilder(recipes[3], calories[3]),
              ]
          ),
        ),
        floatingActionButton: FloatingActionButton(backgroundColor: Colors.white, foregroundColor: Colors.black.withOpacity(0.7),
            child: Icon(Icons.add),onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => AddRecipe()));}
        ));
  }
}

