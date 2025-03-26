import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:form_builder_train/app/routes.dart';
import 'package:form_builder_train/login/views/mobile/loginbloc/login_bloc.dart';
import 'package:responsive_framework/responsive_framework.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  ThemeData themeData = ThemeData.light(); // Default theme

  try {
    final String jsonString = await rootBundle.loadString('assets/material-theme.json');
    final Map<String, dynamic> jsonData = jsonDecode(jsonString);

    // Extract only the "light" theme from the JSON
    final Map<String, dynamic> lightTheme = jsonData['schemes']['light'];

    themeData = createThemeFromJson(lightTheme);
  } catch (e) {
    print("Error loading theme: $e");
  }

  runApp(MyApp(themeData));
}

ThemeData createThemeFromJson(Map<String, dynamic> lightScheme) {
  return ThemeData(
    colorScheme: ColorScheme(
      brightness: Brightness.light,
      primary: parseColor(lightScheme['primary']),
      onPrimary: parseColor(lightScheme['onPrimary']),
      secondary: parseColor(lightScheme['secondary']),
      onSecondary: parseColor(lightScheme['onSecondary']),
      tertiary: parseColor(lightScheme['tertiary']),
      onTertiary: parseColor(lightScheme['onTertiary']),
      error: parseColor(lightScheme['error']),
      onError: parseColor(lightScheme['onError']),
      background: parseColor(lightScheme['background']),
      onBackground: parseColor(lightScheme['onBackground']),
      surface: parseColor(lightScheme['surface']),
      onSurface: parseColor(lightScheme['onSurface']),
      surfaceVariant: parseColor(lightScheme['surfaceVariant']),
      onSurfaceVariant: parseColor(lightScheme['onSurfaceVariant']),
      outline: parseColor(lightScheme['outline']),
    ),
  );
}

// Function to convert HEX string to Flutter Color
Color parseColor(String hexColor) {
  hexColor = hexColor.replaceAll("#", ""); // Remove `#`
  return Color(int.parse("0xFF$hexColor")); // Convert to Color
}

class MyApp extends StatelessWidget {
  final ThemeData themeData;
  const MyApp(this.themeData, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => LoginBloc()),
      ],
      child: MaterialApp.router(
        theme: themeData, // Use the parsed theme
        builder: (context, widget) => ResponsiveWrapper.builder(
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
        routerConfig: Routes().router,
      ),
    );
  }
}
