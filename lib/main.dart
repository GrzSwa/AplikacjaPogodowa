import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/provider/data_provider.dart';
import 'package:weather_app/provider/locationProvider.dart';
import 'package:weather_app/provider/settings_provider.dart';
import 'package:weather_app/provider/weatherProvider.dart';
import 'package:weather_app/screens/splash_screen.dart';

void main() {
  
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider( create: (context)=> LocationProvider() ),
        ChangeNotifierProvider( create: (context)=> WeatherProvider() ),
        ChangeNotifierProvider( create: (context)=> SettingsProvider() ),
        ChangeNotifierProvider( create: (context)=> DataProvider() )
      ],
      child: const SplashScreen(),
    )
  );
}


