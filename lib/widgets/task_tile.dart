import 'package:flutter/material.dart';
import 'package:slave_app/models/task.dart';

class TaskTile extends StatelessWidget {
  final Task task;
  final void Function(String id) discard;

  const TaskTile({
    super.key,
    required this.task,
    required this.discard,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(task.activity),
        subtitle: Text(task.type.titleDisplay),
        trailing: IconButton(
          onPressed: () {
            discard(task.id);
          },
          icon: Icon(Icons.delete_forever_outlined),
        ),
      ),
    );
  }
}
