import 'package:flutter/material.dart';
import 'package:simple_to_do_app/utils/to_do.list.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List toDoList = [
    ['task A', false],
    ['task B', false],
    ['task C', false],
  ];

  final _controller = TextEditingController();

  void CheckboxChanged(int index) {
    setState(() {
      toDoList[index][1] = !toDoList[index][1];
    });
  }

  void deleteTask(int index) {
setState(() {
  toDoList.removeAt(index);
});
  }

  void addNewTask(){
    setState(() {
        toDoList.add([_controller.text, false]);
        _controller.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.deepPurple.shade100,
        appBar: AppBar(
          title: const Text("To Do list app"),
          backgroundColor: Colors.deepPurple.shade200,
          foregroundColor: Colors.white,
        ),
        body: ListView.builder(
            itemCount: toDoList.length,
            itemBuilder: (BuildContext context, index) {
              return ToDoList(
                taskName: toDoList[index][0],
                taskCompleted: toDoList[index][1],
                onchanged: (value) => CheckboxChanged(index),
                deleteFunction: (context) => deleteTask(index),
              );
            }),
        floatingActionButton: Row(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: TextField(
                  controller: _controller,
                  decoration: InputDecoration(
                    hintText: 'Add new task',
                    filled: true,
                    fillColor: Colors.white12,
                      enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 10.0),
              child: FloatingActionButton(
                onPressed: addNewTask,
                child: Icon(Icons.add,
                    color: Colors.deepPurple.shade100, size: 25),
                backgroundColor: Colors.white,
              ),
            ),
          ],
        ));
  }
}