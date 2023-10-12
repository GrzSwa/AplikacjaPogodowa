import 'package:flutter/material.dart';

class ForecastBox extends StatelessWidget {
  final Icon icon;
  final String day;
  final String weather;
  final String temperature;
  const ForecastBox({ Key? key, required this.icon, required this.day, required this.weather, required this.temperature}) : super(key: key);

  @override
  Widget build(BuildContext context){
    return Container(
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              icon,
              const SizedBox(width: 5,),
              Text(day, style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
              const SizedBox(width: 5,),
              Text(weather, style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
            ],
          ),
          Text(temperature, style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),)
        ],
      ),
    );
  }
}