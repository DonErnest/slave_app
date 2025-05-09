import 'package:flutter/material.dart';
import 'package:slave_app/app_routes.dart';
import 'package:slave_app/providers/task_state.dart';
import 'package:slave_app/screens/add_task.dart';
import 'package:slave_app/screens/home.dart';
import 'package:slave_app/theme/dark_theme.dart';
import 'package:slave_app/theme/light_theme.dart';


void main() {
  runApp(
    TaskState(child: MaterialApp(
      theme: lightTheme,
      darkTheme: darkTheme,
      initialRoute: AppRoutes.home,
      routes: {
        AppRoutes.home: (ctx) => MainScreen(),
        AppRoutes.addTask: (ctx) => AddTaskScreen(),
      },
      title: "Task Randomizer(as if you have nothing to do)",
    ))
  );
}
