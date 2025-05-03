import 'package:flutter/material.dart';

class AppTheme {
  static const Color primary = Colors.lightBlue;

  static final ThemeData lightTheme = ThemeData.light().copyWith(
    //Primary Color
    primaryColor: primary,

    //Appbar Theme
    appBarTheme: const AppBarTheme(color: primary, elevation: 0),
  );
}
