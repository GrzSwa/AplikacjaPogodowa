// ignore_for_file: prefer_const_constructors
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:weather_app/components/world_direction.dart';
import 'package:weather_app/provider/weatherProvider.dart';
import 'package:flutter_svg/flutter_svg.dart';
class Other extends StatelessWidget {
const Other({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context){

    String setWindDirection(int value){
      if(value  >= 0 && value < 22.5 || value >= 337.5){
        return "N";
      }else if(value >= 22.5 && value < 67.5){
        return "NE";
      }else if(value >= 67.5 && value < 112.5){
        return "E";
      }else if(value >= 112.5 && value < 157.5){
        return "SE";
      }else if(value >= 157.5 && value < 202.5){
        return "S";
      }else if(value >= 202.5 && value < 247.5){
        return "SW";
      }else if(value >= 247.5 && value < 292.5){
        return "W";
      }else if(value > 292.5 && value < 337.5){
        return "NW";
      }else{
        return value.toString();
      }
    }

    String windspeed = context.watch<WeatherProvider>().getCurrentWeather().getWindspeed.toString();
    String sunrise = context.watch<WeatherProvider>().getDailyweather(0).getSunrise;
    String sunset = context.watch<WeatherProvider>().getDailyweather(0).getSunset;
    String relativehumidity = context.watch<WeatherProvider>().getCurrentWeather().getRelativehumidity.toString();
    String apparentTemperature = context.watch<WeatherProvider>().getCurrentWeather().getApparentTemperature.ceil().toString();
    String surfacePressure = context.watch<WeatherProvider>().getCurrentWeather().getDurfacePressure.ceil().toString();
    String windDirection = setWindDirection(context.watch<WeatherProvider>().getCurrentWeather().getWindDirection);


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
                            Text(windDirection, style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16) ),
                            const SizedBox(height: 5,),
                            Text("$windspeed km/h", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16),)
                          ],
                        ),
                        Expanded(
                          child: Align(
                            alignment: Alignment.centerRight,
                            child: WorldDirection()
                            )
                        )
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
                                TextSpan(text: sunrise, style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 14)),
                                TextSpan(text: " Wschód", style: TextStyle(color: Colors.white.withOpacity(0.6), fontSize: 14)),
                              ]
                            )
                          ),
                          const SizedBox(height: 5,),
                          Text.rich(
                            TextSpan(
                              children: [
                                TextSpan(text: sunset, style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 14)),
                                TextSpan(text: " Zachód", style: TextStyle(color: Colors.white.withOpacity(0.6), fontSize: 14)),
                              ]
                            )
                          )
                          ],
                        ),
                        Expanded(
                          child: Align(
                            alignment: Alignment.centerRight,
                            child: SvgPicture.asset(
                                "assets/sunrise.svg",
                                color: Colors.white,
                                width: double.infinity,
                              )
                            )
                        )
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
                      Text("$apparentTemperatureº", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold,)),
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