import 'package:flutter/material.dart';
import '../../models/task.dart';
import 'task_preview.dart';


class  TaskMaster extends StatelessWidget {
  const TaskMaster({ Key? key, required this.tasks, required this.onClickTask }) : super(key: key);
   final List<Task> tasks;
   final Function onClickTask;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        itemCount :  tasks.length,
        itemBuilder: (context, index){
          return Padding(
            padding : const EdgeInsets.all(12.0),
            child: TaskPreview(task : tasks[index], onClickTask: onClickTask)
          );
        }
      ),
    );
  }
}