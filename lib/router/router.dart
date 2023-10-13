import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:weather_app/screens/add_city.dart';
import 'package:weather_app/screens/city.dart';
import 'package:weather_app/screens/home.dart';
import 'package:weather_app/screens/settings.dart';

GoRouter router = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return const Home();
      },
      routes: <RouteBase>[
        GoRoute(
          path: 'add',
          builder: (BuildContext context, GoRouterState state) {
            return const City();
          },
        ),
        GoRoute(
          path: 'settings',
          builder: (BuildContext context, GoRouterState state) {
            return Settings();
          },
        ),
        GoRoute(
          path: 'add_city',
          builder: (BuildContext context, GoRouterState state) {
            return const AddCity();
          },
        ),
      ],
    ),
  ],
);