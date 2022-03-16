import 'package:flutter/material.dart';
import '../../models/task.dart';


class TaskPreview extends StatelessWidget {
  const TaskPreview({ Key? key, required this.task, required this.onClickTask }) : super(key: key);
  final Task task;
  final Function onClickTask;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      trailing: task.completed ? const Icon(Icons.assignment_turned_in, color: Color.fromARGB(255, 117, 187, 135)) : 
      const Icon(Icons.assignment_turned_in_outlined, color: Color.fromARGB(255, 88, 86, 86)),
      title: Text(task.content),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      tileColor: Colors.grey[300],
      onTap: ()=>onClickTask(task)
    );
  }
}