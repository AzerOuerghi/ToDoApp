import 'package:app1/data/database.dart';
import 'package:app1/utility/dialogBox.dart';
import 'package:app1/utility/todo.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  await Hive.initFlutter();

  var box = await Hive.openBox('mybox');

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({super.key});
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _mybox = Hive.box('mybox');
  final _controller = TextEditingController();
  ToDoDatabase db = ToDoDatabase();

  @override
  void initState() {
    if (_mybox.get("TODOLIST") == null) {
      db.createInitialData();
    } else {
      db.loaddata();
    }
    super.initState();
  }

  //List of tasks

  void checkBoxChanged(bool value, int index) {
    setState(() {
      db.TodoList1[index][1] = !db.TodoList1[index][1];
    });
    db.updatedata();
  }

  void saveNewTask() {
    setState(() {
      db.TodoList1.add([_controller.text, false]);
      _controller.clear();
    });
    Navigator.of(context).pop();
    db.updatedata();
  }

  void createNewTask() {
    showDialog(
        context: context,
        builder: (context) {
          return DialogBox(
            controller: _controller,
            onSave: saveNewTask,
          );
        });
  }

  void deletetask(int index) {
    setState(() {
      db.TodoList1.removeAt(index);
    });
    db.updatedata();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 198, 107, 218),
      appBar: AppBar(
        title: Text("to do"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: createNewTask,
        child: const Icon(Icons.add),
      ),
      body: ListView.builder(
          itemCount: db.TodoList1.length,
          itemBuilder: (context, index) {
            return todoList(
              TaskName: db.TodoList1[index][0],
              completed: db.TodoList1[index][1],
              onChanged: (value) => checkBoxChanged(value!, index),
              deletefunction: (p0) => deletetask(index),
            );
          }),
    );
  }
}
