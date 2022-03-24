import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'add_item_page.dart';


class ToDoListPage extends StatefulWidget {
  const ToDoListPage({Key? key}) : super(key: key);

  @override
  State<ToDoListPage> createState() => _ToDoListPageState();
}

class _ToDoListPageState extends State<ToDoListPage> {
  List itemList = ['ITEM 1', 'ITEM 2', 'ITEM 3', 'ITEM 4'];
  List descriptionList = ['ITEM 1 DESCRIPTION', 'ITEM 2 DESCRIPTION', 'ITEM 3 DESCRIPTION', 'ITEM 4 DESCRIPTION'];

  ElevatedButton elevatedButtonBuilder(String item, String description){
    return ElevatedButton(onPressed: () {  },
        child: Column(
            children: [
              Text(item, style: TextStyle(fontFamily: 'Rubik', fontSize: 15.0)),
              Text(description, style: TextStyle(fontFamily: 'Rubik', fontSize: 15.0,)),
            ]
        )
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('My Shopping List',textAlign: TextAlign.center, style: TextStyle(fontSize: 30, fontFamily: 'Rubik')),centerTitle: true, backgroundColor: Colors.white, foregroundColor: Colors.black),
      body: Center (
        //padding: EdgeInsets.all(5),
        child: Container (
          child: Column(
            children: [
              Container(
                  child: elevatedButtonBuilder(itemList[0], descriptionList[0])
                ),
                SizedBox(height: 2.0),
                Container(
                    child: elevatedButtonBuilder(itemList[1], descriptionList[1])
                ),
                SizedBox(height: 2.0),
                Container(
                    child: elevatedButtonBuilder(itemList[2], descriptionList[2])
                ),
                SizedBox(height: 2.0),
                Container(
                  child: elevatedButtonBuilder(itemList[3], descriptionList[3])
              ),
              // etc..
      ]),
    )
    ),
      floatingActionButton: FloatingActionButton(backgroundColor: Colors.white, foregroundColor: Colors.black.withOpacity(0.7),
          child: Icon(Icons.add),onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context) => AddTask()));
    }),
    );
  }
}

