import 'dart:convert';
import 'dart:io';

import 'package:slave_app/helpers/get_data_file_path.dart';
import 'package:slave_app/models/task.dart';

Future<void> saveTasks(List<Task> tasks) async {
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
  final tasksJson = jsonEncode(tasksMaps);
  await file.writeAsString(tasksJson);
}

Future<List<Task>> loadTasks() async {
  try {
    final filePath = await getDataFilePath("tasks");
    final file = File(filePath);
    final jsonContents = await file.readAsString();
    final tasksMaps = jsonDecode(jsonContents) as List<dynamic>;
    return List<Task>.from(
      tasksMaps.map((taskMap) => Task.fromJson(taskMap)).toList(),
    );
  } catch (error) {
    return [];
  }
}
