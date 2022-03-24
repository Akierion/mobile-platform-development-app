import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fluttertoast/fluttertoast.dart';

class AddTask extends StatefulWidget {
  const AddTask({Key? key}) : super(key: key);

  @override
  State<AddTask> createState() => _AddTaskState();
}

class _AddTaskState extends State<AddTask> {
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  addTaskToFirebase() async {
    FirebaseAuth auth = FirebaseAuth.instance;
    final User user = await auth.currentUser!;
    final uid = user.uid;
    var time = DateTime.now();

    await FirebaseFirestore.instance
        .collection('shopping lists')
        .doc(uid)
        .collection('shopping list')
        .doc(time.toString())
        .set({'title': titleController.text, 'description': descriptionController.text, 'time': time
        });
    Fluttertoast.showToast(msg: 'Shopping item added');
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
                controller: titleController,
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
                    addTaskToFirebase();
                  },
                  child: Text('Add Item', style: TextStyle(fontFamily: 'Rubik', fontSize: 17.0,))),
            )]
    )
      )
    );
  }
}
