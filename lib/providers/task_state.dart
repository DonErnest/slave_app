import 'package:flutter/material.dart';
import 'package:slave_app/models/task.dart';
import 'package:slave_app/providers/task_provider.dart';

class TaskState extends StatefulWidget {
  final Widget child;

  const TaskState({super.key, required this.child});

  @override
  State<TaskState> createState() => _TaskStateState();
}

class _TaskStateState extends State<TaskState> {
  List<Task> readyTasks = [];
  List<Task> newTasks = [];

  @override
  void initState() {
    super.initState();
  }

  void addNewTask(Task task) {
    setState(() {
      newTasks.add(task);
    });
  }


  void markTaskAsDone(Task task) {
    setState(() {
      readyTasks.add(task);
    });
  }

  void cancelReadyTask(Task task) {
    setState(() {
      readyTasks.remove(task);
    });
  }

  @override
  Widget build(BuildContext context) {
    return TaskProvider(
      newTasks: newTasks,
      accomplishedTasks: readyTasks,
      accomplishTask: markTaskAsDone,
      addNewTask: addNewTask,
      cancelTask: cancelReadyTask,
      child: widget.child,
    );
  }
}
