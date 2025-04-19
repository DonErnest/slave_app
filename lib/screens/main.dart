import 'package:flutter/material.dart';
import 'package:slave_app/app_routes.dart';
import 'package:slave_app/widgets/canvas.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}



class _MainScreenState extends State<MainScreen> {
  void goToCategories() {
    Navigator.of(context).pushNamed(AppRoutes.categories);
  }

  @override
  Widget build(BuildContext context) {
    return ScreenCanvas(
      widgets: [
        ElevatedButton(onPressed: goToCategories, child: Text("Create new task")),
      ],
      appBarTitleText: "Home",
    );
  }
}
