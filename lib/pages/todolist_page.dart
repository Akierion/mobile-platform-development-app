import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ToDoListPage extends StatefulWidget {
  ToDoListPage({Key? key}) : super(key: key);


  @override
  State<ToDoListPage> createState() => _ToDoListPageState();
}

class _ToDoListPageState extends State<ToDoListPage> {
  List todos = List.empty();
  String title = '';
  String description = "";

  @override
  void initState() {
    super.initState();
    todos = ['Hello', 'Hello There'];
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: ListView.builder(
          shrinkWrap: true,
          itemCount: todos.length,
          itemBuilder: (BuildContext context, int index) {
            return Dismissable(
              key: Key(index.toString()),
              child: Card(
                elevation: 4.0,
                child: ListTile (
                  title: Text(todos[index]),
                  subtitle: Text('Description', style: TextStyle(fontSize: 15.0, fontFamily: 'Rubik',fontWeight: FontWeight.bold)),
                  trailing: IconButton (
                    icon: const Icon(Icons.delete),
                    color: Colors.red,
                    onPressed: () {
                      setState(() {
                        todos.removeAt(index);
                      });
                    },
                  ),
                )
              )
            );
          },
        ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(context: context, builder: BuildContext(context) {
            return AlertDialog(
              shape: RoundedRectangleBorder (
                  borderRadius: BorderRadius.circular(10.0)),
                title: const Text('Add To List'),
              content: Container(
                width: 400,
                height: 100,
                child: Column (
                  children: [
                    TextField(
                      onChanged: (String value) {
                        title = value;
                      }
                    ),
                    TextField(
                      onChanged: (String value) {
                        description = value;
                      }
                    )
                  ],
                )
              )


            );
          }
        }
      ),
    );
  }
}




