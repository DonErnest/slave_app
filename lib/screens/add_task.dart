import 'package:flutter/material.dart';
import 'package:slave_app/models/task.dart';
import 'package:slave_app/providers/task_provider.dart';
import 'package:slave_app/widgets/canvas.dart';

class AddTaskScreen extends StatefulWidget {
  const AddTaskScreen({super.key});

  @override
  State<AddTaskScreen> createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  late TaskProvider taskProvider;

  final activityController = TextEditingController();
  TaskCategory selectedTaskType = TaskCategory.random;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    taskProvider = TaskProvider.of(context)!;
  }

  void onSave() {
    if (activityController.text != '') {
      final newTask = CreateTask(activity: activityController.text, type: selectedTaskType);
      taskProvider.addNewTask(newTask);
      Navigator.pop(context);
    }
  }
  
  @override
  Widget build(BuildContext context) {
    return ScreenCanvas(widgets: [
      TextField(
        controller: activityController,
        maxLines: 5,
        maxLength: 200,
        decoration: InputDecoration(label: Text('Enter activity description')),
      ),
      Divider(),
      Text("Choose category"),
      Wrap(
        spacing: 5.0,
        children:
        List<Widget>.generate(
            TaskCategory.values.length,
                (int idx) {
          return ChoiceChip(
            label: Text("${TaskCategory.values[idx].titleDisplay}"),
            selected: selectedTaskType == TaskCategory.values[idx],
            onSelected: (bool selected) {
              setState(() {
                selectedTaskType = selected ? TaskCategory.values[idx]: TaskCategory.random;
              });
            },
          );
        }).toList(),
      ),
      ElevatedButton(
        onPressed: onSave,
        child: Text("Save"),
      ),
    ], appBarTitleText: "Add task");
  }
}
