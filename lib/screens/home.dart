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
  int currentScreenIndex = 0;

  void goToCategories() {
    Navigator.of(context).pushNamed(AppRoutes.categories);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    taskProvider = TaskProvider.of(context)!;
    switch (currentScreenIndex) {
      case 0:
        selectedTasks = taskProvider.newTasks;
      case 1:
        selectedTasks = taskProvider.accomplishedTasks;
    }
  }

  void updateCurrentPageIndex(int newIndex) {
    setState(() {
      switch (newIndex) {
        case 0:
          selectedTasks = taskProvider.newTasks;
        case 1:
          selectedTasks = taskProvider.accomplishedTasks;
      }
      currentScreenIndex = newIndex;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ScreenCanvas(
      widgets: [
        if (selectedTasks.isNotEmpty)
          Expanded(
            flex: 5,
            child: ListView.builder(
              itemCount: selectedTasks.length,
              itemBuilder: (ctx, idx) => TaskTile(
                  task: selectedTasks[idx],
                  markReady: taskProvider.accomplishTask,
                  discard: taskProvider.cancelTask,
              ),
            ),
          ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 0.0),
          child: ElevatedButton(
            onPressed: goToCategories,
            child: Text("Create new task"),
          ),
        ),
      ],
      appBarTitleText: "You have earned ${taskProvider.score} scores",
      bottomBar: NavigationBar(
        selectedIndex: currentScreenIndex,
        onDestinationSelected: updateCurrentPageIndex,
        destinations: [
          NavigationDestination(
            icon: Icon(Icons.list_alt_outlined),
            selectedIcon: Icon(Icons.view_list_outlined),
            label: "New tasks",
          ),
          NavigationDestination(
            icon: Icon(Icons.task_outlined),
            selectedIcon: Icon(Icons.task),
            label: "Accomplished tasks",
          ),
        ],
      ),
    );
  }
}
