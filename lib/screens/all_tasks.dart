
import 'package:flutter/material.dart';
import 'package:todolist/main.dart';
import '../components/tasks/task_master.dart';
import '../components/tasks/task_detail.dart';
import 'package:todolist/data/tasks.dart' as data;
import '../models/task.dart';
import 'package:provider/provider.dart';
import '../data/tasks_collection.dart';
import 'create_task.dart';


class AllTasks extends StatefulWidget {
  const AllTasks({Key? key, required this.title}) : super(key: key);
  final String? title;
  static String get route => '/all_tasks';
  @override
  State<AllTasks> createState() => _AllTasksState();
}

//Les données sont présente dans  data.tasks;
class _AllTasksState extends State<AllTasks> {
  List<Task> tasks = data.tasks;
  Task? chosenTask;

  //Appel au provider pour charger les données.
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance?.addPostFrameCallback((timeStamp) {
      Provider.of<TasksCollection>(context, listen: false).getAllTasksFromAPI();
    });
  }

  void _updateTask(){
  }
  //Récuperer la task envoyé depuis PreviewTask
  void onClickTask(task) {
    setState(() {
      chosenTask = task;
    });
  }

  void onClosed() {
    setState(() {
      chosenTask = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<TasksCollection>(
        builder: (context, tasksCollection, child) {
      return Scaffold(
        appBar: AppBar(
          title: const Text(TodoList.title),
          centerTitle: true,
          toolbarHeight: 60,
          backgroundColor: const Color.fromARGB(255, 231, 193, 22),
          elevation: 0.0,
        ),
        body: Visibility(
            child: TaskMaster(tasks: tasksCollection.getAllTasks(), onClickTask: onClickTask),
            visible: (chosenTask == null),
            replacement: TaskDetails(
                task: chosenTask,
                onClosed: onClosed,
                onDelete: () {
                  final snackBar = SnackBar(
                    content: const Text('Are you sure you wanna delete?'),
                    duration: const Duration(seconds: 3),
                    backgroundColor: const Color.fromARGB(255, 231, 193, 22),
                    action: SnackBarAction(
                      label: 'Yes',
                      textColor: Colors.white,
                      onPressed: () {
                        tasksCollection.delete(chosenTask!.id);
                        ScaffoldMessenger.of(context)
                            .showSnackBar(const SnackBar(
                          content: Text('Deleted'),
                        ));
                        onClosed();
                      },
                    ),
                  );
                  // Appelle la snack bar
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                },
                 onUpdateTask: _updateTask,
                )),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.pushNamed(context, CreateTask.route);
                            onClosed();
          },
          tooltip: 'Add a Task',
          child: const Icon(Icons.add),
          backgroundColor: const Color.fromARGB(255, 231, 193, 22),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      );
    });
  }
}








