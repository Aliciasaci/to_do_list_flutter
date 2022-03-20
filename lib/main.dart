import 'package:flutter/material.dart';
import 'screens/all_tasks.dart';
import 'package:provider/provider.dart';
import '../data/tasks_collection.dart';
import 'screens/one_task.dart';
import 'screens/create_task.dart';


void main() {
  runApp(
    MultiProvider(
      providers : [
        ChangeNotifierProvider(create: (_) => TasksCollection()),
      ],
          child : const TodoList()),
    );
}

class TodoList extends StatelessWidget {
  const TodoList({Key? key}) : super(key: key);
  static const String title = 'To do list';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: title,
      theme: ThemeData(
        fontFamily: 'Poppins',
      ),
      // home: const AllTasks(title : 'To do list'),
      initialRoute: AllTasks.route,
      routes : {
        AllTasks.route: (context) => const AllTasks(title : 'To do list'),
        OneTask.route : (context) => const OneTask(),
        CreateTask.route : (context) => const CreateTask(),
      } 
    );
  }
}


