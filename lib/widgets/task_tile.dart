import 'package:flutter/material.dart';
import 'package:slave_app/models/task.dart';

class TaskTile extends StatelessWidget {
  final Task task;
  final void Function(Task task) markReady;
  final void Function(String key) discard;

  const TaskTile({
    super.key,
    required this.task,
    required this.markReady,
    required this.discard,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading:
            task.done
                ? null
                : IconButton(
                  onPressed: () {
                    markReady(task);
                  },
                  icon: Icon(Icons.check_box_outline_blank),
                ),
        title: Text(task.activity),
        subtitle: Text(task.type.titleDisplay),
        trailing: IconButton(
          onPressed: () {
            discard(task.key);
          },
          icon: Icon(Icons.delete_forever_outlined),
        ),
      ),
    );
  }
}
