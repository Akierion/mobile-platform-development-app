import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fluttertoast/fluttertoast.dart';

class AddItem extends StatefulWidget {
  const AddItem({Key? key}) : super(key: key);

  @override
  State<AddItem> createState() => _AddItemState();
}

class _AddItemState extends State<AddItem> {
  // ---- Controllers used to store user input taken from TextField()
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  addTaskToFirebase() async {
    // ----- Firebase, makes sure that the user is authenticated
    FirebaseAuth auth = FirebaseAuth.instance;
    final User user = await auth.currentUser!;
    final uid = user.uid;
    var time = DateTime.now();
    // ----- Stores the information in Firebase as shopping lists (collection) --> userID (document) --> shopping list (collection) --> timestamp (document) --> description, time and title as fields of final collection
    await FirebaseFirestore.instance
        .collection('shopping lists')
        .doc(uid)
        .collection('shopping list')
        .doc(time.toString())
        .set({'title': titleController.text, 'description': descriptionController.text, 'time': time
        });
    Fluttertoast.showToast(msg: 'Shopping item added'); // Added a 'toast' to pop up when a new item has been added to shopping lists (Firebase)
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('New Item'),
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
                controller: titleController, // Stores user input from the title's 'TextField' into a controller so that it can be used to store data in Firebase as shown above (same for descriptionController too)
                decoration: InputDecoration(
                  labelText: 'Shopping Item Name',
                  border: OutlineInputBorder()
                ),
              )),
            SizedBox(height: 10.0),
            Container(
                child: TextField(
                  controller: descriptionController,
                  decoration: InputDecoration(
                      labelText: 'Description (optional)',
                      border: OutlineInputBorder()
                  ),
                )),
            SizedBox(height: 10.0),
            Container(
              width: double.infinity,
              height: 50.0,
              child: ElevatedButton(
                  onPressed: (){
                    addTaskToFirebase(); // When button is pressed, add item to Cloud Firestore
                  },
                  child: Text('Add Item', style: TextStyle(fontFamily: 'Rubik', fontSize: 17.0,))),
            )]
    )
      )
    );
  }
}
