import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/components/title_box.dart';
import 'package:weather_app/components/weather_on_the_hour.dart';
import 'package:weather_app/components/wether_icon.dart';
import 'package:weather_app/provider/weatherProvider.dart';

class HourlyForecast extends StatelessWidget {
const HourlyForecast({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context){
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
      decoration: BoxDecoration(
        color: Colors.blue.withOpacity(0.6),
        borderRadius: BorderRadius.circular(20),
      ),
      // ignore: prefer_const_constructors
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          const TitleBox(icon: Icons.timelapse,title: "24-godzinna prognoza pogody"),
          const SizedBox(height: 15),
          Expanded(
            child:ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: context.watch<WeatherProvider>().getHourlyWeatherList().length,
              itemBuilder: (context,index){
                return Container(
                  margin: const EdgeInsets.symmetric(horizontal: 5),
                  child: WeatherOnTheHour(
                    temperature: "${context.watch<WeatherProvider>().getHourlyWeather(index).temperature.ceil().toString()}ºC", 
                    icon:  WeatherIcon().getIcon(context.watch<WeatherProvider>().getHourlyWeather(index).getWeathercode), 
                    windSpeed: "${context.watch<WeatherProvider>().getHourlyWeather(index).windspeed.toString()} km/h", 
                    hour: context.watch<WeatherProvider>().getHourlyWeather(index).time.toString()
                  )
                );
              }
            )
          )
        ],
      )
    );
  }
}