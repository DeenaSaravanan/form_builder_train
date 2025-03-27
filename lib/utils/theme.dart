import 'package:flutter/material.dart';
import 'package:form_builder_train/utils/customer_theme/elevated_theme.dart';
import 'package:form_builder_train/utils/customer_theme/inputborder_theme.dart';
import 'package:form_builder_train/utils/customer_theme/text_theme.dart';

class TAppTheme{
  TAppTheme._();

  static ThemeData lightTheme= ThemeData(
    useMaterial3: true,
    fontFamily: 'Poppins',
    brightness: Brightness.light,
    primaryColor: Colors.white,
    scaffoldBackgroundColor: Colors.white,
    textTheme: TTextTheme.lightTextTheme,
    elevatedButtonTheme: TElevatedButtonTheme.lightElevatedButtonTheme,
    inputDecorationTheme: TInputBorderTheme.lightInputBorderTheme,
  );
  static ThemeData darkTheme= ThemeData(
     useMaterial3: true,
    fontFamily: 'BungeeTint',
    brightness: Brightness.dark,
    primaryColor: Colors.blue,
    scaffoldBackgroundColor: Colors.white,
    textTheme: TTextTheme.darkTextTheme,
    elevatedButtonTheme: TElevatedButtonTheme.lightElevatedButtonTheme,
  );
}