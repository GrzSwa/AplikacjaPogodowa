import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/provider/locationProvider.dart';
import 'package:weather_app/provider/settings_provider.dart';
import 'package:weather_app/provider/weatherProvider.dart';
import 'package:weather_app/router/router.dart' as routerScreens;

void main() {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  /*runApp(
    ChangeNotifierProvider(
      create: (context)=>LocationProvider(),
      child: const MyApp(),
    )
  );*/
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider( create: (context)=> LocationProvider() ),
        ChangeNotifierProvider( create: (context)=> WeatherProvider() ),
        ChangeNotifierProvider( create: (context)=> SettingsProvider())
      ],
      child: const MyApp(),
    )
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: routerScreens.router,
    );
  }
}

