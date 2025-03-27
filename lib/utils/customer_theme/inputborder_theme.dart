import 'package:flutter/material.dart';

class TInputBorderTheme {
  TInputBorderTheme._(); 

  static final lightInputBorderTheme = InputDecorationTheme(
    border: OutlineInputBorder(borderRadius: BorderRadius.circular(10), borderSide: BorderSide(color: Colors.purple, width: 2)),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: BorderSide(color: Color(0xFFCC3F9D), width: 2,),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: BorderSide(color: Color(0xFFCC3F9D), width: 2)
    ),
    labelStyle: TextStyle(color: Color(0xFFCC3F9D))
  );

  static final darkInputBorderTheme = InputDecorationTheme(
    border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
    fillColor: Colors.white,
  );
}
