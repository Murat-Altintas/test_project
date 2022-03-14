import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData themeData = ThemeData(
    colorScheme:
        ColorScheme.fromSwatch().copyWith(primary: Colors.pinkAccent[100]),
    textTheme: const TextTheme(
      bodyText1: TextStyle(
        color: Colors.deepPurple,
        fontSize: 30,
      ),
      bodyText2: TextStyle(
        color: Colors.deepPurpleAccent,
        fontSize: 30,
      ),
    ),
  );
}
