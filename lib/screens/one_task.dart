import 'package:flutter/material.dart';
import 'package:todolist/data/tasks_collection.dart';
import 'package:provider/provider.dart';
import 'package:todolist/models/task.dart';
import 'package:todolist/components/tasks/task_form.dart';

class OneTask extends StatefulWidget {
  const OneTask({Key? key})
      : super(key: key);
  static String get route => "one_task";
  @override
  State<OneTask> createState() => _OneTaskState();
  
}

class _OneTaskState extends State<OneTask> {

  @override
  Widget build(BuildContext context) {
        final Task? task = ModalRoute.of(context)!.settings.arguments as Task?;
    return Scaffold(
      appBar: AppBar(
        title: const Text("To do list"),
        centerTitle: true,
        toolbarHeight: 60,
        backgroundColor: const Color.fromARGB(255, 231, 193, 22),
        elevation: 0.0,
      ),
      body:
          Consumer<TasksCollection>(builder: (context, tasksCollection, child) {
            return TaskForm(
            taskToUpdate: task,
            onChangeTask: (newTask) {
              setState(() {
                tasksCollection.update(newTask);
              });
            },
          );
      }),
    );
  }
}





//extraire les informations à partir de la route, avec context.