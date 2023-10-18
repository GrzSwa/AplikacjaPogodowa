import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/provider/weatherProvider.dart';

class SevenDayBox extends StatelessWidget {
  final String day;
  final String icon;
  final String minTemperature;
  final String maxTemperature;
  final String windspeed;
  const SevenDayBox({ Key? key, required this.day, required this.icon, required this.minTemperature,required this.maxTemperature, required this.windspeed}) : super(key: key);

  @override
  Widget build(BuildContext context){
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Column(
            children: [
              Text(context.watch<WeatherProvider>().getDailyweather(0).getDayOfTheWeek(day), style: const TextStyle(fontSize: 16),),
              const SizedBox(height: 3,),
              Text(day.substring(5,10).replaceAll("-", "."), style: const TextStyle(fontSize: 12, color: Colors.grey)),
              const SizedBox(height: 20,),
              Text(icon, style: const TextStyle(fontSize: 26),),
            ],
          )
        ),

        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(maxTemperature, style: const TextStyle(fontSize: 16)),
              Text(minTemperature, style: const TextStyle(fontSize: 16)),
              Text(windspeed),
            ],
          )
        )
        

      ],
    );
  }
}