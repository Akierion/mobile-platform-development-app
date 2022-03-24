import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'add_item_page.dart';


class ToDoListPage extends StatefulWidget {
  const ToDoListPage({Key? key}) : super(key: key);

  @override
  State<ToDoListPage> createState() => _ToDoListPageState();
}

class _ToDoListPageState extends State<ToDoListPage> {
  String uid = '';

  @override
  void initState() {
    getuid();
    super.initState();
  }

  getuid() async {
    FirebaseAuth auth = FirebaseAuth.instance;
    final User user = await auth.currentUser!;
    setState(() {
      uid = user.uid;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('My Shopping List',textAlign: TextAlign.center, style: TextStyle(fontSize: 30, fontFamily: 'Rubik')),centerTitle: true, backgroundColor: Colors.white, foregroundColor: Colors.black),
        body: Container(),
          floatingActionButton: FloatingActionButton(backgroundColor: Colors.white, foregroundColor: Colors.black.withOpacity(0.7),
          child: Icon(Icons.add),onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context) => AddTask()));
    }),
    );
  }
}

