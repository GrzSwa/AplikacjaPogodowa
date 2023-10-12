import 'package:flutter/material.dart';


class WeatherOnTheHour extends StatelessWidget {
  final String temperature;
  final Icon icon;
  final String windSpeed;
  final String hour;
  const WeatherOnTheHour({ Key? key, required this.temperature, required this.icon, required this.windSpeed, required this.hour}) : super(key: key);

  @override
  Widget build(BuildContext context){
    return Container(
        padding: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.white.withOpacity(0.6)), // Ustal kolor obramówki na biały
          borderRadius: BorderRadius.circular(20.0), // Zaokrągl krawędzie
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(temperature, style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16),),
            Column(
              children: [
                icon,
                const SizedBox(height: 5),
                Text(windSpeed, style: TextStyle(color: Color.fromRGBO(255, 255, 255, 0.6)),),
                const SizedBox(height: 5),
                Text(hour, style: TextStyle(color: Color.fromRGBO(255, 255, 255, 0.6)),),
              ],
            )
          ],
        )

    );
  }
}