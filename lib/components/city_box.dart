import 'package:flutter/material.dart';

class CityBox extends StatelessWidget {
  String city;
  String? temperature;
  CityBox({ Key? key, required this.city, this.temperature}) : super(key: key);

  @override
  Widget build(BuildContext context){
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 15),
      margin: EdgeInsets.only(top: 10),
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 58, 144, 255),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(city, style: TextStyle(color: Colors.white.withOpacity(0.7), fontSize: 20),),
          Text(temperature ?? "-", style: TextStyle(color: Colors.white.withOpacity(0.7), fontSize: 20),),
        ],
      ),
    );
  }
}