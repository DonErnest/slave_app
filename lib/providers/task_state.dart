import 'package:flutter/material.dart';
import 'package:slave_app/data/task_data.dart';
import 'package:slave_app/models/task.dart';
import 'package:slave_app/providers/task_provider.dart';
import 'package:slave_app/services/task.dart';

class TaskState extends StatefulWidget {
  final Widget child;

  const TaskState({super.key, required this.child});

  @override
  State<TaskState> createState() => _TaskStateState();
}

class _TaskStateState extends State<TaskState> {
  List<Task> tasks = [];
  int score = 0;

  @override
  void initState() {
    super.initState();
    loadData();
  }

  Future<void> loadData() async {
    final (loadedTasks, loadedScore) = await getSavedTasksAndScore();
    setState(() {
      tasks = loadedTasks;
      score = loadedScore;
    });
  }

  void addNewTask(Task task) {
    setState(() {
      tasks.add(task);
      saveTasks(tasks, score);
    });
  }

  void markTaskAsDone(Task readyTask) {
    final taskIdx = tasks.indexWhere((task) => task.key == readyTask.key);
    readyTask.done = true;
    setState(() {
      score ++;
      tasks[taskIdx] = readyTask;
      saveTasks(tasks, score);
    });
  }

  void cancelReadyTask(String key) {
    setState(() {
      tasks.removeWhere((task) => task.key == key);
      saveTasks(tasks, score);
    });
  }

  @override
  Widget build(BuildContext context) {
    return TaskProvider(
      score: score,
      tasks: tasks,
      accomplishTask: markTaskAsDone,
      addNewTask: addNewTask,
      cancelTask: cancelReadyTask,
      child: widget.child,
    );
  }
}
