import 'package:flutter/material.dart';

class CityBox extends StatelessWidget {
  String city;
  String? temperature;
  String? air;
  CityBox({ Key? key, required this.city, this.temperature, this.air}) : super(key: key);

  @override
  Widget build(BuildContext context){
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      margin: const EdgeInsets.only(top: 10),
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 27, 95, 185),
        borderRadius: BorderRadius.circular(15),
      ),
      child: ListTile(
        title: Text(city, style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white, letterSpacing: 1.0),),
        subtitle: Text(air != null ? "IJP $air" : "IJP -", style: TextStyle( color: Colors.white.withOpacity(0.6))),
        trailing: Text(temperature != null ? "$temperatureºC" : "-ºC", style: TextStyle(color: Colors.white, fontSize: 25),),
      )
    );
  }
}