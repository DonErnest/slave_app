import 'package:flutter/material.dart';


final darkColorScheme = ColorScheme.fromSeed(
  seedColor: Color.fromRGBO(219, 34, 42, 1),
  dynamicSchemeVariant: DynamicSchemeVariant.expressive,
  brightness: Brightness.dark,
);
final darkTheme = ThemeData.dark().copyWith(
    colorScheme: darkColorScheme,
    appBarTheme: AppBarTheme().copyWith(
      foregroundColor: darkColorScheme.onPrimaryContainer,
      titleTextStyle: TextStyle(
          color: darkColorScheme.onPrimaryContainer
      ),
      toolbarTextStyle: TextStyle(color: darkColorScheme.onPrimaryContainer),
      actionsIconTheme: IconThemeData(color: darkColorScheme.onPrimaryContainer),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: Color.fromRGBO(31, 122, 140, 1),
        foregroundColor: Colors.white,
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        backgroundColor: Color.fromRGBO(31, 122, 140, 1),
        foregroundColor: Colors.white,
      ),
    ),
    iconTheme: IconThemeData(color: Color.fromRGBO(191, 219, 247, 1)),
    extensions: []
);
