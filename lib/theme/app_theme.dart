import 'package:flutter/material.dart';

enum AppTheme {
  blueLight("Blue Light"),
  blueDark("Blue Dark"),
  redDark("Red Dark");

  final String name;
  const AppTheme(this.name);
}

final appThemeDate = {
  AppTheme.blueLight: ThemeData(
      appBarTheme: AppBarTheme(color: Colors.blue),
      brightness: Brightness.light,
      primaryColor: Colors.blue),
  AppTheme.blueDark: ThemeData(
      appBarTheme: AppBarTheme(color: Colors.blue[700]),
      brightness: Brightness.dark,
      primaryColor: Colors.blue[700]),
  AppTheme.redDark: ThemeData(
      appBarTheme: AppBarTheme(color: Colors.red),
      brightness: Brightness.dark,
      primaryColor: Colors.red),
};
