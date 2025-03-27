import 'package:flutter/material.dart';

class TTextTheme{
  
  static TextTheme lightTextTheme= TextTheme(
    headlineLarge: TextStyle().copyWith(fontSize: 32, fontWeight: FontWeight.bold, color: Colors.black, ),
    headlineMedium: TextStyle().copyWith(fontSize: 24, fontWeight: FontWeight.w500, color: Colors.black),
    
    titleLarge: TextStyle(fontSize: 40, color: Colors.black, fontFamily: 'Poppins'),
    titleMedium: TextStyle().copyWith(fontSize: 35, fontWeight: FontWeight.w500, color: Colors.black),
    titleSmall: TextStyle().copyWith(fontSize: 16, fontWeight: FontWeight.w300, color: Colors.black),

    bodyMedium: TextStyle().copyWith(fontSize: 14, fontWeight: FontWeight.normal, color: Colors.black),  
    bodySmall: TextStyle().copyWith(fontSize: 10, fontWeight: FontWeight.normal, color: Colors.black),  
  );
  static TextTheme darkTextTheme= TextTheme(
    headlineLarge: TextStyle().copyWith(fontSize: 32, fontWeight: FontWeight.bold, color: Colors.white),
    headlineMedium: TextStyle().copyWith(fontSize: 24, fontWeight: FontWeight.w500, color: Colors.white),

     titleMedium: TextStyle().copyWith(fontSize: 16, fontWeight: FontWeight.w500, color: Colors.white),
    titleSmall: TextStyle().copyWith(fontSize: 16, fontWeight: FontWeight.w300, color: Colors.white),    
 
   
    bodyMedium: TextStyle().copyWith(fontSize: 14, fontWeight: FontWeight.normal, color: Colors.white),  
    bodySmall: TextStyle().copyWith(fontSize: 10, fontWeight: FontWeight.normal, color: Colors.white),  
  );
}