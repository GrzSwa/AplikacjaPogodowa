import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/components/wether_icon.dart';
import 'package:weather_app/provider/weatherProvider.dart';

class Temperature extends StatelessWidget {
const Temperature({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context){

    String temperature = context.watch<WeatherProvider>().getCurrentWeather().getTemperature.ceil().toString();
    String minTemperature = context.watch<WeatherProvider>().getDailyweather(0).getMinTemperature.ceil().toString();
    String maxTemperature = context.watch<WeatherProvider>().getDailyweather(0).getMaxTemperature.ceil().toString();
    String airQuality = context.watch<WeatherProvider>().getCurrentWeather().getAirQuality.toString();
    String weather = WeatherIcon().getWeather(context.watch<WeatherProvider>().getCurrentWeather().getWeathercode);
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(temperature, style: const TextStyle(
              fontSize: 90,
              color: Colors.white
            ),),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 15), 
              child: Text("ºC", style: TextStyle(
                fontSize: 25,
                color: Colors.white
              ),)
            )
          ],
        ),
        Text('$weather $minTemperatureº / $maxTemperatureº', 
          style: const TextStyle(
            fontSize: 16,
            color: Colors.white,
            fontWeight: FontWeight.bold
          ),
        ),
        const SizedBox(height:15),
        Container(
          padding: const EdgeInsets.symmetric(vertical: 3, horizontal: 10),
          decoration: BoxDecoration(
            color: Colors.blue.withOpacity(0.9),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Text.rich(
            TextSpan(
              children: [
                const WidgetSpan(child: Icon(Icons.energy_savings_leaf_rounded, size: 15, color: Colors.white)),
                TextSpan(text: " IJP $airQuality", style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.white))
              ]
            )
          )
        )
      ],
    );
  }
}