import 'package:flutter/material.dart';
import 'package:slave_app/app_routes.dart';
import 'package:slave_app/models/task.dart';
import 'package:slave_app/providers/task_provider.dart';
import 'package:slave_app/widgets/canvas.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  late TaskProvider taskProvider;
  late List<Task> tasks;

  void goToCategories() {
    Navigator.of(context).pushNamed(AppRoutes.categories);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    taskProvider = TaskProvider.of(context)!;
    // if favorites selected there must me something here
    tasks = taskProvider.newTasks;
  }

  @override
  Widget build(BuildContext context) {
    return ScreenCanvas(
      widgets:
          tasks.isEmpty
              ? [
                ElevatedButton(
                  onPressed: goToCategories,
                  child: Text("Create new task"),
                ),
              ]
              : tasks.map((task) => Text(task.activity)).toList(),
      appBarTitleText: "Home",
    );
  }
}
