import 'package:flutter/cupertino.dart';
import 'package:slave_app/models/task.dart';

class TaskProvider extends InheritedWidget {
  final List<Task> tasks;
  final bool loading;

  final void Function(String taskKey) deleteTask;
  final void Function(CreateTask accTask) addNewTask;


  const TaskProvider({
    super.key,
    required super.child,
    required this.tasks,
    required this.addNewTask,
    required this.deleteTask,
    required this.loading
  });


  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) {
    return true;
  }

  static TaskProvider? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<TaskProvider>();
  }
}
