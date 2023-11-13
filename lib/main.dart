import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/provider/data_provider.dart';
import 'package:weather_app/provider/locationProvider.dart';
import 'package:weather_app/provider/settings_provider.dart';
import 'package:weather_app/provider/weatherProvider.dart';
import 'package:weather_app/screens/splash_screen.dart';
import 'dart:io';

class MyHttpProviders extends HttpOverrides{
  @override
  HttpClient createHttpClient(SecurityContext? context){
    return super.createHttpClient(context)
      ..badCertificateCallback = (X509Certificate cert, String host, int port)=> true;
  }
}

void main() {
  HttpOverrides.global=new MyHttpProviders();
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


