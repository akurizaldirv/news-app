import 'package:flutter/material.dart';

ThemeData theme() {
  return ThemeData(
    scaffoldBackgroundColor: Colors.white,
    // fontFamily: "Inter",
    appBarTheme: appBarTheme()
  );
}

AppBarTheme appBarTheme() {
  return const AppBarTheme(
    color: Colors.black,
    elevation: 0,
    centerTitle: true,
    iconTheme: IconThemeData(color: Colors.purpleAccent),
    titleTextStyle: TextStyle(color: Colors.purpleAccent, fontSize: 18)
  );
}