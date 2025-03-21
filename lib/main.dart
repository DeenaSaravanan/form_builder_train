import 'package:flutter/material.dart';
import 'package:form_builder_train/login.dart';
import 'package:responsive_framework/responsive_framework.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      builder:
          (context, widget) => ResponsiveWrapper.builder(
            widget,
            maxWidth: 1200,
            minWidth: 450,
            defaultScale: true,
            breakpoints: [
              const ResponsiveBreakpoint.resize(450, name: MOBILE),
              const ResponsiveBreakpoint.resize(800, name: TABLET),
              const ResponsiveBreakpoint.resize(1200, name: DESKTOP),
            ],
          ),
      debugShowCheckedModeBanner: false,
      home: RegistrationPage(),
    );
  }
}
