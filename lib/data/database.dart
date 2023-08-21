import 'package:hive/hive.dart';

class ToDoDataBase {
  List toDoList = [];
  final _mybox = Hive.box('mybox');

  void createInitialData() {
    toDoList = [
      ["Go to gym", false],
      ["Eat breakfast!", false]
    ];
  }
  //load

  void loadData() {
    toDoList = _mybox.get("TODOLIST");
  }

  //update

  void updateDataBase() {
    _mybox.put("TODOLIST", toDoList);
  }
}
