import 'package:flutter/material.dart';
import 'package:todo_ui/models/task.dart';
import 'package:todo_ui/services/database_service.dart';

class TasksData extends ChangeNotifier {
  List<Task> tasks = [];
  void addTask(String taskTitle) async {
    Task task = await DatabaseService.addTask(taskTitle);
    tasks.add(task);
    notifyListeners();
  }

  void updateTask(Task task) {
    task.toggle();
    DatabaseService.updateTask(task.id);
    notifyListeners();
  }

  void deleteTask(Task task) {
    tasks.remove(task);
    DatabaseService.deleteTask(task.id);
    notifyListeners();
  }
}
