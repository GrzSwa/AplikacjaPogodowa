// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:go_router/go_router.dart';
import 'package:location/location.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/components/hourly_forecast.dart';
import 'package:weather_app/components/other.dart';
import 'package:weather_app/components/temperature.dart';
import 'package:weather_app/components/weather_forecast.dart';
import 'package:weather_app/provider/locationProvider.dart';
import 'package:weather_app/services/location_service.dart';

class Home extends StatefulWidget {
  const Home({ Key? key }) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  @override
  void initState() {
    super.initState();
    initialization();
  }

  void initialization() async {
    LocationService locationService = LocationService();
    LocationData data = await locationService.getLocation();
    String city = await locationService.getCity();
    if(city != "Brak lokalizacji")
      Provider.of<LocationProvider>(context, listen: false).setCity(city);
    FlutterNativeSplash.remove();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: IconButton(onPressed: ()=> context.go('/add'), icon: Icon(Icons.add)),
        actions: [
          IconButton(onPressed: ()=> context.go('/settings'), icon: Icon(Icons.settings))
        ],
        title: Text(context.watch<LocationProvider>().getName),
        centerTitle: true,
      ),
      backgroundColor: Color.fromARGB(255, 34, 126, 230),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 1.8,
              child: Center(child: Temperature())
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 3,
              child: Padding(
                padding: EdgeInsets.all(10.0), 
                child: WeatherForecast(),
              ),
            ),
            SizedBox(
              
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 4,
              child: Padding(
                padding: EdgeInsets.all(10.0), 
                child: HourlyForecast(),
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 4,
              child: Padding(
                padding: EdgeInsets.all(10.0), 
                child: Other(),
              ),
            ),

            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: 40,
              child: Padding(
                padding: EdgeInsets.all(10.0), 
                child: Center(
                  child: Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(text: "Dane zapewnione przez ", style: TextStyle(color: Colors.white.withOpacity(0.6), fontSize: 13)),
                      TextSpan(text: "Open-Meteo", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 15))
                    ]
                  )
                ))
              ),
            ),
          ],
        ),
      ),
    );
  }
}