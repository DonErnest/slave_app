import 'package:flutter/material.dart';
import 'package:slave_app/app_routes.dart';
import 'package:slave_app/models/task.dart';
import 'package:slave_app/providers/task_provider.dart';
import 'package:slave_app/services/task.dart' show getNewTask;
import 'package:slave_app/widgets/canvas.dart';

class CategoriesScreen extends StatefulWidget {
  const CategoriesScreen({super.key});

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  late TaskProvider taskProvider;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    taskProvider = TaskProvider.of(context)!;
  }


  Future<void> fetchTasks(
    BuildContext ctx,
    TaskCategory selectedCategory,
  ) async {
    final fetchedTask = await getNewTask(selectedCategory);
    if (fetchedTask != null) {
      taskProvider.addNewTask(fetchedTask);
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return ScreenCanvas(
      widgets:
          TaskCategory.values
              .map(
                (category) => Expanded(
                  child: TextButton(
                    onPressed: () {
                      fetchTasks(context, category);
                    },
                    child: Text(category.titleDisplay),
                  ),
                ),
              )
              .toList(),
      appBarTitleText: "Choose category, you score is ${taskProvider.score}",
    );
  }
}
