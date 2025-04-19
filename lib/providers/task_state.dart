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
  List<Task> accomplished = [];

  @override
  void initState() {
    super.initState();
  }

  void markTaskAsDone(Task task) {
    setState(() {
      accomplished.add(task);
    });
  }

  void cancelReadyTask(Task task) {
    setState(() {
      accomplished.remove(task);
    });
  }

  @override
  Widget build(BuildContext context) {
    return TaskProvider(
      accomplishedTasks: accomplished,
      accomplishTask: markTaskAsDone,
      cancelTask: cancelReadyTask,
      child: widget.child,
    );
  }
}
