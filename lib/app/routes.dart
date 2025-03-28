import 'package:flutter/material.dart';
import 'package:form_builder_train/app/route_names.dart';
import 'package:form_builder_train/home/home.dart';
import 'package:form_builder_train/login/views/login_page.dart';
import 'package:form_builder_train/register/views/register_mobile.dart';
import 'package:go_router/go_router.dart';

class Routes {
  GoRouter router = GoRouter(
    initialLocation: '/login',
    routes: [
       GoRoute(
        name: RouteNames.login,
        path: '/login',
        builder:  (BuildContext context, GoRouterState state){
          return LoginPage();
        }),
          GoRoute(
            name: RouteNames.register,
            path: '/register',
            builder: (BuildContext context, GoRouterState state){
              return RegisterMobile();
            }),
            GoRoute(
              name: RouteNames.home,
              path: '/home',
              builder: (BuildContext context, GoRouterState State){
                return Myhome();
              })
    ]
    
    );
}