import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/components/city_box.dart';
import 'package:weather_app/provider/locationProvider.dart';

class City extends StatelessWidget {
const City({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: ()=> context.go('/'), icon: const Icon(Icons.arrow_back, color: Colors.black,)),
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: const Text("Zarządzaj miastami", style: TextStyle(color: Colors.black),),
        centerTitle: true,
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
        child: Column(
          children: [

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: ElevatedButton.icon(
                icon: const Icon(Icons.search, size: 16, color: Colors.grey,),
                label: const Text('Dodaj lokalizację', style: TextStyle(color: Colors.grey),),
                style: ElevatedButton.styleFrom(
                  alignment: Alignment.centerLeft,
                  backgroundColor: const Color.fromARGB(255, 225, 225, 225), 
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8), 
                  minimumSize: const Size(double.infinity, 40),
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20), 
                  ),
                ),
                onPressed: ()=> context.go('/add_city'),
              )
            ),

            const SizedBox(height: 15),

            Expanded(
              child: ListView.builder(
                itemCount: Provider.of<LocationProvider>(context,listen: true).getListOfLocations.length,
                itemBuilder: (context, index){
                  return CityBox(
                    city: context.watch<LocationProvider>().getListOfLocations[index].getName, 
                    temperature: context.watch<LocationProvider>().getListOfLocations[index].getTemperature,
                    air: context.watch<LocationProvider>().getListOfLocations[index].getAirQuality,
                  );
                }
              )
            )

          ],
        ),
      ),
    );
  }
}