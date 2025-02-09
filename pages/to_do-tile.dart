import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class ToDoTile extends StatelessWidget {

  final String taskName;
  final bool taskCompleted;
  Function(bool?)? onChanged;
  Function(BuildContext)? deleteFunction;
  ToDoTile({super.key, required this.taskName,
    required this.taskCompleted,
    required this.onChanged,
    required this.deleteFunction,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 25, top:25, right:25),
      child: Slidable(
        endActionPane: ActionPane(
          motion: StretchMotion(),
          children: [
            SlidableAction(
              onPressed: deleteFunction,
              icon: Icons.delete,
              backgroundColor: Colors.red,
              )
          ],
        ),
        child:Container(
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.blue,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            children: [
              // Добавьте Checkbox, если необходимо
              Checkbox(value: taskCompleted, onChanged: onChanged),
              Text(taskName, style: TextStyle(fontSize: 20, decoration: taskCompleted ? TextDecoration.lineThrough : TextDecoration.none)),
            ],
          ),
        ),
      )
    );
  }
}
