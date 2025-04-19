import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:slave_app/models/task.dart';
import 'package:slave_app/providers/task_provider.dart';

class TaskState extends StatefulWidget {
  final Widget child;

  const TaskState({super.key, required this.child});

  @override
  State<TaskState> createState() => _TaskStateState();
}

class _TaskStateState extends State<TaskState> {
  List<Task> tasks = [];

  @override
  void initState() {
    super.initState();
  }

  void addNewTask(Task task) {
    setState(() {
      tasks.add(task);
    });
  }

  void markTaskAsDone(Task readyTask) {
    final taskIdx = tasks.indexWhere((task) => task.key == readyTask.key);
    readyTask.done = true;
    setState(() {
      tasks[taskIdx] = readyTask;
    });
  }

  void cancelReadyTask(String key) {
    setState(() {
      tasks.removeWhere((task) => task.key == key);
    });
  }

  @override
  Widget build(BuildContext context) {
    return TaskProvider(
      tasks: tasks,
      accomplishTask: markTaskAsDone,
      addNewTask: addNewTask,
      cancelTask: cancelReadyTask,
      child: widget.child,
    );
  }
}
