import 'dart:convert';
import 'dart:io';

import 'package:slave_app/helpers/get_data_file_path.dart';
import 'package:slave_app/models/task.dart';

Future<void> saveTasks(List<Task> tasks, int score) async {
  final filePath = await getDataFilePath("tasks");
  final file = File(filePath);
  final tasksMaps =
      tasks
          .map(
            (joke) => {
              'key': joke.key,
              'activity': joke.activity,
              'type': joke.type.name,
              'participants': joke.participants,
              'price': joke.price,
              'link': joke.link,
              'accessibility': joke.accessibility,
              'done': joke.done,
            },
          )
          .toList();
  final Map<String, dynamic> data = {"tasks": tasksMaps, "score": score};
  final tasksJson = jsonEncode(data);
  await file.writeAsString(tasksJson);
}

Future<(List<Task>, int)> loadTasks() async {
  try {
    final filePath = await getDataFilePath("tasks");
    final file = File(filePath);
    final jsonContents = await file.readAsString();
    final data = jsonDecode(jsonContents) as Map<String, dynamic>;
    final tasksMaps = data["tasks"];
    return (List<Task>.from(
      tasksMaps.map((taskMap) => Task.fromJson(taskMap)).toList(),
    ), data["score"] as int);
  } catch (error) {
    return (List<Task>.from([]), 0);
  }
}
