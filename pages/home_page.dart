import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:learning_flutter/data/database.dart';
import 'package:hive/hive.dart';

import 'dialog_box.dart';
import 'to_do-tile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final _myBox = Hive.box('myBox');

  final _controller = TextEditingController();

  ToDoDataBase db = ToDoDataBase();

  @override
  void initState(){
    if (_myBox.get("TODOLIST") == null){
      db.createInitialData();
    }else {
      db.loadData();
    }
    super.initState();
  }
  void checkBoxChanged(bool? value, int index){
    setState(() {
      db.toDoList[index][1] = !db.toDoList[index][1];
    });
    db.updateDataBase();
  }

  void saveNewTask(){
    setState(() {
      db.toDoList.add([_controller.text, false]);
      _controller.clear();
    });
    Navigator.of(context).pop();
    db.updateDataBase();

  }

  void deleteTask(int index){
    setState(() {
      db.toDoList.removeAt(index);
    });
    db.updateDataBase();

  }

  void createNewTask(){
    showDialog(context: context, builder: (context){
      return DialogBox(
        controller: _controller,
        onSave: saveNewTask,
        onCancel: () => Navigator.of(context).pop(),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.blue,
        title: Text('To Do App', style: TextStyle(fontSize: 25, color: Colors.white)),
        elevation: 10,
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: createNewTask,
          child: Icon(Icons.add),
          backgroundColor: Colors.blue,
      ),
      body: ListView.builder(
        itemCount: db.toDoList.length,
        itemBuilder: (context, index){
          return ToDoTile(
            taskName: db.toDoList[index][0],
            taskCompleted: db.toDoList[index][1],
            onChanged: (value)=>checkBoxChanged(value, index),
            deleteFunction: (p0)=> deleteTask(index),

          );
        }

      ),
    );
  }
}


