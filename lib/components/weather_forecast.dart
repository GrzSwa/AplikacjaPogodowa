import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/components/forecast_box.dart';
import 'package:weather_app/components/title_box.dart';
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
          TitleBox(icon: Icons.calendar_month_rounded,title: "7-dniowa prognoza pogody"),
          ForecastBox(
            icon: Icon(Icons.waterfall_chart, color: Colors.white,), 
            day: "Czw.",
            weather: "Deszcz", 
            temperature: "${context.watch<WeatherProvider>().getDailyweather(0).getMinTemperature.toString()}º / ${context.watch<WeatherProvider>().getDailyweather(0).getMaxTemperature.toString()}º"
          ),
          ForecastBox(
            icon: Icon(Icons.waterfall_chart, color: Colors.white,), 
            day: "Pt.", 
            weather: "Pochmurno", 
            temperature: "${context.watch<WeatherProvider>().getDailyweather(1).getMinTemperature.toString()}º / ${context.watch<WeatherProvider>().getDailyweather(1).getMaxTemperature.toString()}º"
          ),
          ForecastBox(
            icon: Icon(Icons.waterfall_chart, color: Colors.white,), 
            day: "Sob.", 
            weather: "Pogodnie", 
            temperature: "${context.watch<WeatherProvider>().getDailyweather(2).getMinTemperature.toString()}º / ${context.watch<WeatherProvider>().getDailyweather(2).getMaxTemperature.toString()}º"
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Color.fromRGBO(255, 255, 255, 0.2), 
                padding: EdgeInsets.symmetric(horizontal: 25, vertical: 8), 
                minimumSize: Size(double.infinity, 40),
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20), 
                ),
              ),
              onPressed: (){}, 
              child: Text("Prognoza 7-dniowa", style: TextStyle(color: Colors.white),)
            )
          )
        ],
      )
    );
  }
}