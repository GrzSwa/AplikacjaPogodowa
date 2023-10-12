import 'package:flutter/material.dart';
import 'package:weather_app/components/forecast_box.dart';
import 'package:weather_app/components/title_box.dart';

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
          ForecastBox(icon: Icon(Icons.waterfall_chart, color: Colors.white,), day: "Czw.", weather: "Deszcze", temperature: "21º / 12º"),
          ForecastBox(icon: Icon(Icons.waterfall_chart, color: Colors.white,), day: "Pt.", weather: "Pochmurno", temperature: "19º / 11º"),
          ForecastBox(icon: Icon(Icons.waterfall_chart, color: Colors.white,), day: "Sob.", weather: "Pogodnie", temperature: "22º / 16º"),
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