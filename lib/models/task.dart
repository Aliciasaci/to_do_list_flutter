class Task{
  int id;
  String content;
  bool completed;    //détermine si la tâche a été réalisée ou non
  DateTime createdAt;

  //You create a Dart class constructor by adding a class method with the same name as the class itself. Often, constructors take parameters to initialize member variables:

    Task(this.id,this.content,this.completed,this.createdAt);
}