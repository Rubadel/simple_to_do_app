import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:simple_to_do_app/home_page.dart';

class ToDoList extends StatelessWidget {
  ToDoList(
      {Key? key,
      required this.taskName,
      required this.taskCompleted,
      required this.onchanged,
      required this.deleteFunction}) : super(key: key);

  String taskName;
  bool taskCompleted;
  final Function(bool?)? onchanged;
  final Function(BuildContext)? deleteFunction;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
          left: 20.0, top: 17.0, right: 20.0, bottom: 0.0),
      child: Slidable(
        endActionPane: ActionPane(
          motion: StretchMotion(),
          children: [
            SlidableAction(
              onPressed: deleteFunction,
              icon: Icons.delete,
              borderRadius: BorderRadius.circular(10),
              backgroundColor: Colors.red.shade500,)
          ],
        ),
        child: Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.white54,
            borderRadius: BorderRadius.circular(7),
          ),
          child: Row(
            children: [
              Checkbox(
                value: taskCompleted,
                onChanged: onchanged,
                checkColor: Colors.white,
                activeColor: Colors.purple.shade200,
                side: BorderSide(color: Colors.purple.shade200),
              ),
              Text(
                taskName,
                style: TextStyle(
                  color: Colors.deepPurple.shade900,
                  fontSize: 14,
                  decoration: taskCompleted
                      ? TextDecoration.lineThrough
                      : TextDecoration.none,
                  decorationColor: Colors.deepPurple.shade900,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
