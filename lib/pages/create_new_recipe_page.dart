import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';

class AddRecipe extends StatefulWidget {
  const AddRecipe({Key? key}) : super(key: key);

  @override
  State<AddRecipe> createState() => _AddRecipeState();
}

class _AddRecipeState extends State<AddRecipe> {
  TextEditingController recipeNameController = TextEditingController();
  TextEditingController instructionController = TextEditingController();

  addRecipeToFirebase() async {
    FirebaseAuth auth = FirebaseAuth.instance;
    final User user = await auth.currentUser!;
    final uid = user.uid;
    var time = DateTime.now();

    await FirebaseFirestore.instance
        .collection('recipes')
        .doc(uid)
        .collection('my recipes')
        .doc(time.toString())
        .set({'title': recipeNameController.text, 'description': instructionController.text, 'time': time
    });
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
                        controller: recipeNameController,
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
                    width: double.infinity,
                    height: 50.0,
                    child: ElevatedButton(
                        onPressed: (){
                          addRecipeToFirebase();
                        },
                        child: Text('Add Item', style: TextStyle(fontFamily: 'Rubik', fontSize: 17.0,))),
                  )]
            )
        )
    );
  }
}
