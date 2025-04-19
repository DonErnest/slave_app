import 'package:flutter/cupertino.dart';
import 'package:slave_app/models/task.dart';

class TaskProvider extends InheritedWidget {
  final List<Task> tasks;

  final void Function(Task accTask) accomplishTask;
  final void Function(String taskKey) cancelTask;
  final void Function(Task accTask) addNewTask;

  const TaskProvider({
    super.key,
    required super.child,
    required this.tasks,
    required this.accomplishTask,
    required this.addNewTask,
    required this.cancelTask,
  });

  List<Task> get accomplishedTasks {
    return tasks.where((task) => task.done == true).toList();
  }

  List<Task> get newTasks {
    return tasks.where((task) => task.done == false).toList();
  }

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) {
    return true;
  }

  static TaskProvider? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<TaskProvider>();
  }
}
