import 'package:json_annotation/json_annotation.dart';

part 'task.g.dart';

@JsonSerializable()
class Task {
  int id;
  String content;
  bool completed;
  DateTime? createdAt;

  Task(this.id, this.content, this.completed, this.createdAt);

  factory Task.fromJson(Map<String, dynamic> json) {
    return Task(json['id'], json['title'], json['completed'], DateTime.now());
  }
}
