import 'package:flutter/material.dart';
import 'package:weather_app/components/title_box.dart';
import 'package:weather_app/components/weather_on_the_hour.dart';

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
          TitleBox(icon: Icons.timelapse,title: "24-godzinna prognoza pogody"),
          const SizedBox(height: 15),
          Expanded(
            child:ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 24,
              itemBuilder: (context,index){
                return Container(
                  margin: EdgeInsets.symmetric(horizontal: 5),
                  child: WeatherOnTheHour(
                    temperature: "18", 
                    icon: Icon(Icons.circle_notifications, color: Colors.white,), 
                    windSpeed: "20,7 km/h", 
                    hour: "${index.toString()}:00"));
              }
            )
          )
          /*Expanded(
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
   
              itemCount: 24,
              itemBuilder: (context,index){
                return Container(
                  margin: EdgeInsets.symmetric(horizontal: 5),
                  child: WeatherOnTheHour(
                    temperature: "18", 
                    icon: Icon(Icons.circle_notifications, color: Colors.white,), 
                    windSpeed: "20,7 km/h", 
                    hour: "${index.toString()}:00"));
              }
            ),
          )*/
        ],
      )
    );
  }
}