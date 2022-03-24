import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ToDoListPage extends StatelessWidget {
  const ToDoListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Your Shopping List', style: TextStyle(fontWeight: FontWeight.bold, fontFamily: 'Rubik', fontSize: 20.0), textAlign: TextAlign.center), backgroundColor: Colors.white, foregroundColor: Colors.black,),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width : MediaQuery.of(context).size.width,
      ),
      floatingActionButton: FloatingActionButton(backgroundColor: Colors.white, foregroundColor: Colors.black.withOpacity(0.7),
          child: Icon(Icons.add),onPressed: (){}),
    );
  }
}





