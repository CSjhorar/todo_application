import 'dart:convert';

import 'package:flutter/rendering.dart';
import 'package:todo_ui/models/task.dart';
import 'package:todo_ui/services/global.dart';
import 'package:http/http.dart' as http;

class DatabaseService {
  static Future<Task> addTask(String title) async {
    Map data = {"title": title};
    var body = json.encode(data);
    var url = Uri.parse(baseUrl + '/add');
    http.Response response = await http.post(url, headers: header, body: body);
    print(response.body);

    Map responseMap = jsonDecode(response.body);
    Task task = Task.fromMap(responseMap);
    return task;
  }

  static Future<List<Task>> getTasks() async {
    var url = Uri.parse(baseUrl);
    http.Response response = await http.get(url, headers: header);
    if (response.statusCode == 200) {
      print(response.body);
      List responseList = jsonDecode(response.body);
      List<Task> tasks = [];
      for (Map taskMap in responseList) {
        Task task = Task.fromMap(taskMap);
        tasks.add(task);
      }
      return tasks;
    } else {
      throw ErrorDescription("api not connected");
    }
  }

  static Future<String> updateTask(int id) async {
    var url = Uri.parse(baseUrl + '/update/$id');
    http.Response response = await http.put(url, headers: header);
    print(response.body);
    return response.toString();
  }

  static Future<String> deleteTask(int id) async {
    var url = Uri.parse(baseUrl + '/delete/$id');
    http.Response response = await http.delete(url, headers: header);
    print(response.body);
    return response.toString();
  }
}
