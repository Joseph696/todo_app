import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:todo_app/data/database.dart';
import 'package:todo_app/utils/dialougebox.dart';
import 'package:todo_app/utils/todo_tiles.dart';

void main() {
  runApp(MaterialApp(
    home: Homepage(),
  ));
}

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  //hivebox
  final _myBox = Hive.box('mybox');
  ToDoDataBase db = ToDoDataBase();

  @override
  void initState() {
    if (_myBox.get("TODOLIST") == null) {
      db.createInitialData();
    } else {
      db.loadData();
    }
    super.initState();
  }

  //textcontrllr
  final _controller = TextEditingController();
  //list of toDo tasks
  // List toDoList = [
  //   ["Workout", false],
  //   ["Eat breakfast", false]
  // ];

  //checkboxchanged

  void checkBoxChanged(bool? value, int index) {
    setState(() {
      db.toDoList[index][1] = !db.toDoList[index][1];
    });
    db.updateDataBase();
  }

  //save new task
  void onSavenewtask() {
    setState(() {
      db.toDoList.add([_controller.text, false]);
      _controller.clear();
    });
    Navigator.of(context).pop();
    db.updateDataBase();
  }

  void createNewTask() {
    showDialog(
      context: context,
      builder: (context) {
        return DialogBox(
          controller: _controller,
          onSave: onSavenewtask,
          onCancel: () => Navigator.of(context).pop(),
        );
      },
    );
  }

  void deleteTask(int index) {
    setState(() {
      db.toDoList.removeAt(index);
      
    });
    db.updateDataBase();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          title: Text('TO DO', style: TextStyle(color: Colors.white)),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: createNewTask,
          child: Icon(Icons.add),
        ),
        backgroundColor: Colors.green[200],
        body: ListView.builder(
          itemCount: db.toDoList.length,
          itemBuilder: (context, index) {
            return ToDotile(
              deleteFunction: (context) => deleteTask(index),
              taskName: db.toDoList[index][0],
              taskCompleted: db.toDoList[index][1],
              onChanged: (value) => checkBoxChanged(value, index),
            );
          },
        ));
  }
}
