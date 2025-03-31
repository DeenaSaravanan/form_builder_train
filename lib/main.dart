import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:form_builder_train/app/routes.dart';
import 'package:form_builder_train/login/bloc/login_bloc.dart';
import 'package:form_builder_train/utils/theme.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:shared_preferences/shared_preferences.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  String language=await getSavedLanguage();
  runApp(MyApp(language: language,));
}

Future<String> getSavedLanguage() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  return prefs.getString('language') ?? 'en'; 

}

class MyApp extends StatelessWidget {
  final String language;
   const MyApp({super.key, required this.language});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => LoginBloc()),
      ],
      child: MaterialApp.router(
        themeMode: ThemeMode.system,
        theme: TAppTheme.lightTheme,
        darkTheme: TAppTheme.darkTheme,
        locale:  Locale("en"),
        supportedLocales: [
          Locale('en'),
          Locale('ta'),
        ],
        localizationsDelegates: [
          AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
        ],
        builder: (context, widget) => ResponsiveWrapper.builder(
          
          widget ?? Container(), 
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