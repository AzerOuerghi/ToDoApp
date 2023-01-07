import 'package:hive/hive.dart';

class ToDoDatabase {
  List TodoList1 = [];

  final _mybox = Hive.box('mybox');

  void createInitialData() {
    TodoList1 = [
      ["first task", false]
    ];
  }

  void loaddata() {
    TodoList1 = _mybox.get('TODOLIST');
  }

  void updatedata() {
    _mybox.put('TODOLIST', TodoList1);
  }
}
