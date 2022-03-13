import 'package:flutter/material.dart';

class ThemesApp{
  static final light= ThemeData(
    primaryColor: Colors.lightGreen,
    backgroundColor: Colors.white,
    brightness: Brightness.light

  );
      static final dark= ThemeData(
  primaryColor: Colors.black,
  backgroundColor: Colors.black,
  brightness: Brightness.dark);
}