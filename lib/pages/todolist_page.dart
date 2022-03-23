import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ToDoListPage extends StatefulWidget {
  const ToDoListPage({Key? key}) : super(key: key);

  @override
  State<ToDoListPage> createState() => _ToDoListPageState();
}

class _ToDoListPageState extends State<ToDoListPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: 24.0,
        vertical: 32.0,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(padding: EdgeInsets.all(10.0),
            child:Text('My Shopping List:', style: TextStyle(fontSize: 20.0, fontFamily: 'Rubik'),)),
          Card()
        ],
      ),
    );
  }
}
