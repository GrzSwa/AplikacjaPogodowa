// ignore_for_file: prefer_const_constructors
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:weather_app/provider/weatherProvider.dart';
class Other extends StatelessWidget {
const Other({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context){

    String windspeed = context.watch<WeatherProvider>().getCurrentWeather().getWindspeed.toString();
    String sunrise = context.watch<WeatherProvider>().getDailyweather(0).getSunrise;
    String sunset = context.watch<WeatherProvider>().getDailyweather(0).getSunset;
    String relativehumidity = context.watch<WeatherProvider>().getCurrentWeather().getRelativehumidity.toString();
    String apparentTemperature = context.watch<WeatherProvider>().getCurrentWeather().getApparentTemperature.toString();
    String surfacePressure = context.watch<WeatherProvider>().getCurrentWeather().getDurfacePressure.toString();

    return Row(
      children: [
        Expanded(
          child: Column(
            children: [
              Expanded(
                child: Container(
                  padding: EdgeInsets.only(bottom: 5),
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
                    decoration: BoxDecoration(
                      color: Colors.blue.withOpacity(0.6),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("PN-z", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16) ),
                            const SizedBox(height: 5,),
                            Text("$windspeed km/h", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16),)
                          ],
                        ),
                        Icon(Icons.circle, size: 80, color: Colors.white,)
                      ],
                    ),  
                  ),
                ),
              ),  

              Expanded(
                child: Container(
                  padding: EdgeInsets.only(top: 5),
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
                    decoration: BoxDecoration(
                      color: Colors.blue.withOpacity(0.6),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text.rich(
                            TextSpan(
                              children: [
                                TextSpan(text: "$sunrise", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 14)),
                                TextSpan(text: " Wschód", style: TextStyle(color: Colors.white.withOpacity(0.6), fontSize: 14)),
                              ]
                            )
                          ),
                          const SizedBox(height: 5,),
                          Text.rich(
                            TextSpan(
                              children: [
                                TextSpan(text: "$sunset", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 14)),
                                TextSpan(text: " Zachód", style: TextStyle(color: Colors.white.withOpacity(0.6), fontSize: 14)),
                              ]
                            )
                          )
                          ],
                        ),
                        Icon(Icons.circle, size: 80, color: Colors.white,)
                      ],
                    ),  
                  ),
                ),
              ), 
            ],
          ) 
        ),

        Expanded(
          child: Container(
            padding: EdgeInsets.only(left: 10),
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
              decoration: BoxDecoration(
                color: Colors.blue.withOpacity(0.6),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Wilgotność', style: TextStyle(color: Colors.white.withOpacity(0.6) )),
                      Text('$relativehumidity%', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold,)),
                    ],
                  ),
                  Divider(color: Colors.white.withOpacity(0.6),),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Odczuwalnie', style: TextStyle(color: Colors.white.withOpacity(0.6) )),
                      Text(apparentTemperature, style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold,)),
                    ],
                  ),
                  Divider(color: Colors.white.withOpacity(0.6),),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('UV', style: TextStyle(color: Colors.white.withOpacity(0.6) )),
                      Text('-', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold,)),
                    ],
                  ),
                  Divider(color: Colors.white.withOpacity(0.6),),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Ciśnienie', style: TextStyle(color: Colors.white.withOpacity(0.6) )),
                      Text('${surfacePressure}mbar', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold,)),
                    ],
                  ),
                  Divider(color: Colors.white.withOpacity(0.6),),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Szansa na deszcz', style: TextStyle(color: Colors.white.withOpacity(0.6) )),
                      Text('-', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold,)),
                    ],
                  ),
                  Divider(color: Colors.white.withOpacity(0.6),),
                ],
              ),
            ),
          ) 
        )
        
      ],
    );
  }
}