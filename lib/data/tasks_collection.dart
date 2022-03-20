import 'package:flutter/material.dart';
import 'tasks.dart' as data;
import 'package:todolist/models/task.dart' ;
import 'package:dio/dio.dart';
//Store de données.
class TasksCollection extends ChangeNotifier {


      final List<Task> _tasks = data.tasks;
      String uriAPI = "https://jsonplaceholder.typicode.com/todos";
      // final String _createStatut = "delete";
      // String get createStatut => _createStatut;

  void create(task) {
    _tasks.add(task);
     notifyListeners();
  }

  void update(newTask) {
     _tasks[_tasks.indexWhere((item) => item.id == newTask.id)] = newTask;
     notifyListeners();
  }  

  List<Task> getAllTasks() {
    return _tasks;
  }

  Future getAllTasksFromAPI() async {
    var response = await Dio().get(uriAPI,
        options: Options(headers: {
          Headers.contentTypeHeader: 'application/json',
          Headers.acceptHeader: 'application/json'
        }));
    List task = response.data;
    List task5 = task.getRange(1, 5).toList();
    _tasks.addAll(task5.map((i) => Task.fromJson(i)).toList());
    notifyListeners();
    return _tasks;
  }

  void delete(int id) {
    _tasks.removeWhere((item) => item.id == id);
     notifyListeners();
  }


  int getNewId(){
    return _tasks.length + 1;
  }
}
