import 'package:flutter/cupertino.dart';
import 'package:slave_app/models/task.dart';

class TaskProvider extends InheritedWidget {
  final List<Task> accomplishedTasks;
  final void Function(Task accTask) accomplishTask;
  final void Function(Task cancelTask) cancelTask;

  const TaskProvider({
    required super.child,
    required this.accomplishedTasks,
    required this.accomplishTask,
    required this.cancelTask,
  });

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) {
    return true;
  }

  static TaskProvider? of (BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<TaskProvider>();
  }
}
