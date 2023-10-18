import 'package:flutter/material.dart';

class ForecastBox extends StatelessWidget {
  final String icon;
  final String day;
  final String weather;
  final String temperature;
  const ForecastBox({ Key? key, required this.icon, required this.day, required this.weather, required this.temperature}) : super(key: key);

  @override
  Widget build(BuildContext context){
    return SizedBox(
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Text(icon, style: const TextStyle(fontSize: 18),),
              const SizedBox(width: 5,),
              Text(day, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
              const SizedBox(width: 5,),
              Text(weather, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
            ],
          ),
          Text(temperature, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),)
        ],
      ),
    );
  }
}