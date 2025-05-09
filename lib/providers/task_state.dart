import 'dart:async';

import 'package:flutter/material.dart';
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
  bool loading = true;

  @override
  void initState() {
    super.initState();
    loadData();
  }

  Future<void> loadData() async {
    final loadedTasks = await getTasks();
    setState(() {
      tasks = loadedTasks;
      loading = false;
    });
  }

  void addNewTask(CreateTask task) {
    setState(() {
      saveTask(task);
      loading = true;
    });
    loadData();
  }


  void deleteTask(String id) {
    setState(() {
      removeTask(id);
      loading = true;
    });
    loadData();
  }

  @override
  Widget build(BuildContext context) {
    return TaskProvider(
      loading: loading,
      tasks: tasks,
      addNewTask: addNewTask,
      deleteTask: deleteTask,
      child: widget.child,
    );
  }
}
