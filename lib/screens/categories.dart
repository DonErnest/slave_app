import 'package:flutter/material.dart';
import 'package:slave_app/models/task.dart';
import 'package:slave_app/widgets/canvas.dart';

class CategoriesScreen extends StatefulWidget {
  const CategoriesScreen({super.key});

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  @override
  Widget build(BuildContext context) {
    return ScreenCanvas(
      widgets:
          TaskCategory.values
              .map(
                (category) => Expanded(
                  child: TextButton(
                    onPressed: () {},
                    child: Text(category.titleDisplay),
                  ),
                ),
              )
              .toList(),
      appBarTitleText: "Choose category",
    );
  }
}
