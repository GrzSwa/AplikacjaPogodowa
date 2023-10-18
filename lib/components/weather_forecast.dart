import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/components/forecast_box.dart';
import 'package:weather_app/components/title_box.dart';
import 'package:weather_app/components/wether_icon.dart';
import 'package:weather_app/provider/weatherProvider.dart';

class WeatherForecast extends StatelessWidget {
const WeatherForecast({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context){

    
    
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 3, horizontal: 10),
      decoration: BoxDecoration(
        color: Colors.blue.withOpacity(0.6),
        borderRadius: BorderRadius.circular(20),
      ),
      // ignore: prefer_const_constructors
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          const TitleBox(icon: Icons.calendar_month_rounded,title: "7-dniowa prognoza pogody"),
          ForecastBox(
            icon: WeatherIcon().getIcon(context.watch<WeatherProvider>().getDailyweather(0).getWeathercode), 
            day: context.watch<WeatherProvider>().getDailyweather(0).getDayOfTheWeek(context.watch<WeatherProvider>().getDailyweather(0).getDate),
            weather: WeatherIcon().getWeather(context.watch<WeatherProvider>().getDailyweather(0).getWeathercode), 
            temperature: "${context.watch<WeatherProvider>().getDailyweather(0).getMinTemperature.ceil().toString()}º / ${context.watch<WeatherProvider>().getDailyweather(0).getMaxTemperature.ceil().toString()}º"
          ),
          ForecastBox(
            icon: WeatherIcon().getIcon(context.watch<WeatherProvider>().getDailyweather(1).getWeathercode), 
            day: context.watch<WeatherProvider>().getDailyweather(1).getDayOfTheWeek(context.watch<WeatherProvider>().getDailyweather(1).getDate), 
            weather: WeatherIcon().getWeather(context.watch<WeatherProvider>().getDailyweather(1).getWeathercode), 
            temperature: "${context.watch<WeatherProvider>().getDailyweather(1).getMinTemperature.ceil().toString()}º / ${context.watch<WeatherProvider>().getDailyweather(1).getMaxTemperature.ceil().toString()}º"
          ),
          ForecastBox(
            icon: WeatherIcon().getIcon(context.watch<WeatherProvider>().getDailyweather(2).getWeathercode), 
            day: context.watch<WeatherProvider>().getDailyweather(2).getDayOfTheWeek(context.watch<WeatherProvider>().getDailyweather(2).getDate), 
            weather: WeatherIcon().getWeather(context.watch<WeatherProvider>().getDailyweather(2).getWeathercode), 
            temperature: "${context.watch<WeatherProvider>().getDailyweather(2).getMinTemperature.ceil().toString()}º / ${context.watch<WeatherProvider>().getDailyweather(2).getMaxTemperature.ceil().toString()}º"
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromRGBO(255, 255, 255, 0.2), 
                padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 8), 
                minimumSize: const Size(double.infinity, 40),
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20), 
                ),
              ),
              onPressed: ()=> context.go('/seven_day_forecast'), 
              child: const Text("Prognoza 7-dniowa", style: TextStyle(color: Colors.white),)
            )
          )
        ],
      )
    );
  }
}