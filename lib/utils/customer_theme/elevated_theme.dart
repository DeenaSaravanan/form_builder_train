import 'package:flutter/material.dart';

class TElevatedButtonTheme{
  TElevatedButtonTheme._();

  static final lightElevatedButtonTheme= ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      elevation: 0,
      foregroundColor: Colors.grey,
      backgroundColor: const Color.fromARGB(255, 248, 244, 244),
      //disabledBackgroundColor: Colors.grey,
      //disabledForegroundColor: Colors.purple,
      side: BorderSide(color: Colors.white),
      padding: EdgeInsets.symmetric(horizontal: 10),
      textStyle: TextStyle(fontSize: 16, color: Colors.white, fontWeight: FontWeight.w500),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))
    ),
  );

  static final dartElevatedButtonTheme= ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      elevation: 0,
      foregroundColor: Colors.white,
      backgroundColor: Colors.grey,
      disabledBackgroundColor: Colors.grey,
      disabledForegroundColor: Colors.purple,
      side: BorderSide(color: Colors.pink),
      padding: EdgeInsets.symmetric(horizontal: 10),
      textStyle: TextStyle(fontSize: 16, color: Colors.white, fontWeight: FontWeight.w500),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))
    ),
  );
}