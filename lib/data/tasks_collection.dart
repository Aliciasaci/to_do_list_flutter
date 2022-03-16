import 'package:flutter/material.dart';
import 'tasks.dart' as data;
import 'package:todolist/models/task.dart' ;
//Store de données.
class TasksCollection extends ChangeNotifier {

      final List<Task> _tasks = data.tasks;
      final String _createStatut = "delete";
      String get createStatut => _createStatut;

  void create(task) {
    _tasks.add(task);
     notifyListeners();
  }

  void update(newTask) {
     _tasks[_tasks.indexWhere((item) => item.id == newTask.id)] = newTask;
     notifyListeners();
  }  


  void delete(int id) {
    _tasks.removeWhere((item) => item.id == id);
     notifyListeners();
  }


  int getNewId(){
    return _tasks.length + 1;
  }
}
