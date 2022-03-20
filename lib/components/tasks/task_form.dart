import 'package:flutter/material.dart';
import 'package:todolist/data/tasks_collection.dart';
import 'package:provider/provider.dart';
import 'package:todolist/models/task.dart';

class TaskForm extends StatefulWidget {
  const TaskForm(
      {Key? key, required this.taskToUpdate, required this.onChangeTask})
      : super(key: key);
  final Task? taskToUpdate;
  final Function onChangeTask;
  @override
  State<TaskForm> createState() => _TaskFormState();
}

class _TaskFormState extends State<TaskForm> {
  final _formKey = GlobalKey<FormState>();
  late bool _taskStatus;

  TextEditingController taskContentController = TextEditingController();
  @override
  void initState() {
    super.initState();
    if (widget.taskToUpdate != null) {
      taskContentController =
          TextEditingController(text: widget.taskToUpdate!.content);
      _taskStatus = widget.taskToUpdate!.completed;
    }
  }

  Widget build(BuildContext context) {
    return Consumer<TasksCollection>(
        builder: (context, tasksCollection, child) {
      return Padding(
        padding: const EdgeInsets.fromLTRB(20.0, 200.0, 20.0, 0),
        child: widget.taskToUpdate != null
            ? Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Checkbox(
                      value: _taskStatus,
                      onChanged: (newValue) {
                        setState(() {
                          _taskStatus = newValue!;
                        });
                      },
                    ),
                    TextFormField(
                      controller: taskContentController,
                      decoration: const InputDecoration(
                        fillColor: Color.fromARGB(255, 230, 228, 228),
                        filled: true,
                        prefixIcon: Icon(Icons.edit),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color.fromARGB(255, 107, 107, 104),
                            width: 1.0,
                          ),
                        ),
                       focusedBorder: OutlineInputBorder(
                         borderSide : BorderSide(
                           color :  Color.fromARGB(255, 231, 193, 22),
                           width : 1.0,
                         ),
                       ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter some text';
                        }
                        return null;
                      },
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 18.0),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            primary: const Color.fromARGB(255, 231, 193, 22)),
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            widget.onChangeTask(Task(
                                widget.taskToUpdate!.id,
                                taskContentController.text,
                                _taskStatus,
                                DateTime.now()));
                            Navigator.pop(context);
                            ScaffoldMessenger.of(context).hideCurrentSnackBar();
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  backgroundColor:
                                      Color.fromARGB(255, 231, 193, 22),
                                  content: Text('A task has been updated')),
                            );
                          }
                        },
                        child: const Text('Save'),
                      ),
                    ),
                  ],
                ),
              )
            : Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextFormField(
                      controller: taskContentController,
                      decoration: const InputDecoration(
                        fillColor: Color.fromARGB(255, 230, 228, 228),
                        filled: true,
                        prefixIcon: Icon(Icons.edit),
                         enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color.fromARGB(255, 107, 107, 104),
                            width: 1.0,
                          ),
                        ),
                         focusedBorder: OutlineInputBorder(
                         borderSide : BorderSide(
                           color :  Color.fromARGB(255, 231, 193, 22),
                           width : 1.0,
                         ),
                       ),
                        labelText: 'Your task_',
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter some text';
                        }
                        return null;
                      },
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 18.0),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            primary: const Color.fromARGB(255, 231, 193, 22)),
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            widget.onChangeTask(Task(
                                tasksCollection.getNewId(),
                                taskContentController.text,
                                false,
                                DateTime.now()));
                            Navigator.pop(context);
                            ScaffoldMessenger.of(context).hideCurrentSnackBar();
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content: Text('A task has been created')),
                            );
                          }
                        },
                        child: const Text('Create'),
                      ),
                    ),
                  ],
                ),
              ),
      );
    });
  }
}
