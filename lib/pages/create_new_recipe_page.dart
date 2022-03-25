import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fluttertoast/fluttertoast.dart';

class AddRecipe extends StatefulWidget {
  const AddRecipe({Key? key}) : super(key: key);

  @override
  State<AddRecipe> createState() => _AddRecipeState();
}

class _AddRecipeState extends State<AddRecipe> {
  // Can easily gather more data from user and send it to firebase (e.g. nutritional info & allergens of food etc)
  TextEditingController recipeNameController = TextEditingController();
  TextEditingController instructionController = TextEditingController();
  TextEditingController caloriesController = TextEditingController();

  addRecipeToFirebase() async {
    // First waits for user to be authenticated, and then stores the recipe name, the instructions, the calories and the timestamp in Firebase (similar to add_item_page.dart)
    FirebaseAuth auth = FirebaseAuth.instance;
    final User user = await auth.currentUser!;
    final uid = user.uid;
    var time = DateTime.now();

    await FirebaseFirestore.instance
    // In Firebase it follows the path of recipes --> user ID --> my recipes --> time -->
    // then adds the recipe details e.g. name, instructions, calories & the time it was created (UTC)
        .collection('recipes')
        .doc(uid)
        .collection('my recipes')
        .doc(time.toString())
        .set({'recipe': recipeNameController.text, 'recipe instructions': instructionController.text, 'calories': caloriesController.text, 'time': time}); // Set the 'recipe', 'recipe instructions', 'calories' & 'time' fields to their respective TextField controller
    Fluttertoast.showToast(msg: 'Recipe added');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Create a Recipe", style: TextStyle(fontSize: 20.0, fontFamily: 'Rubik'),),
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
          centerTitle: true,
        ),
        body: Container(
            padding: EdgeInsets.all(10),
            child: Column(
                children: [
                  SizedBox(height: 30.0),
                  Container(
                      child: TextField(
                        controller: recipeNameController, // Stores user input from the recipeName 'TextField' into a controller so that it can be used to store data in Firebase as shown above (same for instructionController and caloriesController)
                        decoration: InputDecoration(
                            labelText: 'Recipe name',
                            border: OutlineInputBorder()
                        ),
                      )),
                  SizedBox(height: 10.0),
                  Container(
                      child: TextField(
                        maxLines: 5,
                        controller: instructionController,
                        decoration: InputDecoration(
                            labelText: 'Enter recipe instructions',
                            border: OutlineInputBorder()
                        ),
                      )),
                  SizedBox(height: 10.0),
                  Container(
                      child: TextField(
                        controller: caloriesController,
                        decoration: InputDecoration(
                            labelText: 'Enter calories per serving',
                            border: OutlineInputBorder()
                        ),
                      )),
                  SizedBox(height: 10.0),
                  Container(
                    width: double.infinity,
                    height: 50.0,
                    child: ElevatedButton(
                        onPressed: (){
                          addRecipeToFirebase(); // Calls addRecipeToFirebase which gets the user's ID, the info regarding recipe e.g. title, instructions and calories and adds them to firebase
                        },
                        child: Text('Add Recipe', style: TextStyle(fontFamily: 'Rubik', fontSize: 17.0,))),
                  )]
            )
        )
    );
  }
}
