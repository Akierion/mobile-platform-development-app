import 'package:flutter/material.dart';
import '../builders/recipe_card_builder.dart';

class DessertsPage extends StatefulWidget {
  DessertsPage({Key? key}) : super(key: key);
  final List<String> recipes = <String> ['Avocado on Toast', 'American Pancakees', 'Eggy Soldiers', 'Porridge'];
  final List<String> calories = <String> ['280', '356', '300', '175'];
  final recipeCardBuilder = RecipeCardBuilder();

  @override
  State<DessertsPage> createState() => _DessertsPageState();
}

class _DessertsPageState extends State<DessertsPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
    );
  }
}
