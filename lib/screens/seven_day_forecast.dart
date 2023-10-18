import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/components/seven_day_box.dart';
import 'package:weather_app/components/wether_icon.dart';
import 'package:weather_app/provider/weatherProvider.dart';

class SevenDayForecast extends StatelessWidget {
const SevenDayForecast({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context){


    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: ()=> context.go('/'), icon: const Icon(Icons.arrow_back, color: Colors.black,)),
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: const Text("Prognoza 7-dniowa", style: TextStyle(color: Colors.black),),
        centerTitle: true,
      ),
      body: Container(
        padding: const EdgeInsets.only(top: 30),
        height: MediaQuery.of(context).size.height / 2,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: 7,
          itemBuilder: (context,index){ 
            return Container(
              margin: const EdgeInsets.symmetric(horizontal: 5),
              width: 85,
              child: SevenDayBox(
                day: context.watch<WeatherProvider>().getDailyweather(index).getDate, 
                icon: WeatherIcon().getIcon(context.watch<WeatherProvider>().getDailyweather(index).getWeathercode), 
                minTemperature: "${context.watch<WeatherProvider>().getDailyweather(index).getMinTemperature.ceil().toString()}º", 
                maxTemperature: "${context.watch<WeatherProvider>().getDailyweather(index).getMaxTemperature.ceil().toString()}º", 
                windspeed: "${context.watch<WeatherProvider>().getDailyweather(index).getWindspeed.toString()} km/h"),
            );
          }
        )
      ),
    );
  }
}