import 'package:flutter/material.dart';
import 'package:form_builder_train/home.dart';
import 'package:form_builder_train/register.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Registrations(),
    );
  }
}
