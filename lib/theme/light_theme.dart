import 'package:flutter/material.dart';

final lightColorScheme = ColorScheme.fromSeed(
  seedColor: Color.fromRGBO(219, 34, 42, 1),
  dynamicSchemeVariant: DynamicSchemeVariant.expressive,
);
final lightTheme = ThemeData.light().copyWith(
  colorScheme: lightColorScheme,
  appBarTheme: AppBarTheme().copyWith(
    backgroundColor: Color.fromRGBO(5, 60, 94, 1),
    titleTextStyle: TextStyle(color: Colors.white, fontSize: 20),
    toolbarTextStyle: TextStyle(color:  Colors.white),
    actionsIconTheme: IconThemeData(color: Colors.white),
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
  iconButtonTheme: IconButtonThemeData(
    style: IconButton.styleFrom(
      backgroundColor: Color.fromRGBO(191, 219, 247, 1),
    ),
  ),
  cardColor: Color.fromRGBO(163, 22, 33, 1),
  // listTileTheme: ListTileThemeData(tileColor: Color.fromRGBO(163, 22, 33, 1)),
  navigationBarTheme: NavigationBarThemeData(
    backgroundColor: Color.fromRGBO(5, 60, 94, 1),
    labelTextStyle: WidgetStatePropertyAll(TextStyle(color: Colors.white)),
    iconTheme: WidgetStatePropertyAll(IconThemeData(color: Colors.white))
  ),
  extensions: [],
);
