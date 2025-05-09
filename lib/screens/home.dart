import 'package:flutter/material.dart';
import 'package:slave_app/app_routes.dart';
import 'package:slave_app/models/task.dart';
import 'package:slave_app/providers/task_provider.dart';
import 'package:slave_app/widgets/canvas.dart';
import 'package:slave_app/widgets/task_tile.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  late TaskProvider taskProvider;
  late List<Task> selectedTasks;

  void goToTaskForm() {
    Navigator.of(context).pushNamed(AppRoutes.addTask);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    taskProvider = TaskProvider.of(context)!;
    selectedTasks = taskProvider.tasks;
  }

  void updateCurrentPageIndex(int newIndex) {
    setState(() {
      selectedTasks = taskProvider.tasks;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ScreenCanvas(
      widgets: [
        taskProvider.loading
            ? Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text('Loading'),
                SizedBox(width: 8),
                SizedBox(
                  width: 16,
                  height: 16,
                  child: CircularProgressIndicator(
                    strokeWidth: 2,
                  ),
                ),
              ],
            )
            : Expanded(
              flex: 5,
              child: ListView.builder(
                itemCount: selectedTasks.length,
                itemBuilder:
                    (ctx, idx) => TaskTile(
                      task: selectedTasks[idx],
                      discard: taskProvider.deleteTask,
                    ),
              ),
            ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 0.0),
          child: ElevatedButton(
            onPressed: goToTaskForm,
            child: Text("Create new task"),
          ),
        ),
      ],
      appBarTitleText: "More tasks for you",
    );
  }
}
