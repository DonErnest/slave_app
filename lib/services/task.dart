import 'dart:convert';

import 'package:http/http.dart';
import 'package:slave_app/data/task_data.dart';
import 'package:slave_app/models/task.dart';

const String baseUri = "https://bored.api.lewagon.com/api/activity";

Future<dynamic> downloadTask(String? params) async {
  var uriStr = baseUri;
  if (params != null) {
    uriStr += params;
  }
  final uri = Uri.parse(uriStr);
  try {
    final response = await get(uri);
    if (response.statusCode == 200) {
      final dynamic jsonData = jsonDecode(response.body);
      return jsonData;
    }
  } catch (error) {
    return null;
  }
  return null;
}

Future<Task?> getNewTask(TaskCategory category) async {
  final params =
      category == TaskCategory.random
          ? ""
          : "?type=${category.name.toString()}";
  final rawData = await downloadTask(params);
  if (rawData != null) {
    return Task.fromJson(rawData);
  }
  return null;
}

Future<(List<Task>, int)> getSavedTasksAndScore() async {
  final tasks = await loadTasks();
  final int score = tasks.where((task) => task.done == true).length;

  return (tasks, score);
}
